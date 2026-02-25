extends Node3D

# --- Configuración en el Inspector ---
@export_group("Referencias")
@export var camera: Camera3D
@export var skeleton: Skeleton3D
@export var ik_target: Marker3D
@export var grab_point: Marker3D

@export_group("Parámetros de Control")
@export var raycast_length: float = 15.0
@export var mouse_sensitivity: float = 0.002
@export var interpolation_speed: float = 40.0 # Aumentado para mayor firmeza

# --- Configuración de Brazo ---
@export_enum("Izquierdo", "Derecho") var lado_control: int = 0 

# --- Variables de Estado ---
var is_grasping: bool = false
var grabbed_object: RigidBody3D = null
var ik_node: SkeletonIK3D = null

func _ready():
	await get_tree().process_frame
	
	ik_node = get_node_or_null("Armature/Skeleton3D/SkeletonIK3D")
	
	if ik_node:
		ik_node.stop()
		if ik_node.root_bone == "" or ik_node.tip_bone == "":
			push_error("ERROR: Asigna los huesos en el Inspector.")
		else:
			if ik_target:
				ik_node.target_node = ik_target.get_path() 
			ik_node.start()
			print("Justina Robot Simulator: Brazo ", name, " listo.")

	if ik_target and grab_point:
		ik_target.global_position = grab_point.global_position

	await get_tree().create_timer(0.2).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var mov_permitido = false
		if lado_control == 0 and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): 
			mov_permitido = true
		elif lado_control == 1 and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT): 
			mov_permitido = true
		
		if mov_permitido:
			var movement = event.relative * mouse_sensitivity
			var right = camera.global_transform.basis.x
			var up = camera.global_transform.basis.y
			
			ik_target.global_position += (right * movement.x) + (-up * movement.y)
			
			var origin_to_target = ik_target.global_position - camera.global_position
			if origin_to_target.length() > raycast_length:
				ik_target.global_position = camera.global_position + origin_to_target.normalized() * raycast_length
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.is_action_pressed("grasp"):
			_start_grasp()
		elif event.is_action_released("grasp"):
			_end_grasp()

func _start_grasp():
	is_grasping = true
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsShapeQueryParameters3D.new()
	var sphere = SphereShape3D.new()
	sphere.radius = 0.15 # Radio un poco más amplio para facilitar el agarre
	
	query.shape = sphere
	query.transform = grab_point.global_transform
	
	var results = space_state.intersect_shape(query)
	for res in results:
		if res.collider is RigidBody3D:
			grabbed_object = res.collider
			grabbed_object.freeze = true
			# CAMBIO CLAVE: Modo STATIC para que el hilo no mueva la aguja mientras la sujetas
			grabbed_object.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
			print(name, " agarró con éxito: ", grabbed_object.name)
			break

func _end_grasp():
	is_grasping = false
	if grabbed_object:
		grabbed_object.freeze = false
		print(name, " soltó el objeto.")
		grabbed_object = null

func _physics_process(delta):
	if ik_target and camera:
		var target_rotation = camera.global_transform.basis.get_rotation_quaternion()
		ik_target.global_transform.basis = Basis(target_rotation)

	if grabbed_object and grab_point:
		# Interpolación más rápida para compensar el peso del hilo
		grabbed_object.global_transform.origin = grabbed_object.global_transform.origin.lerp(grab_point.global_transform.origin, interpolation_speed * delta)
		grabbed_object.global_basis = grabbed_object.global_basis.slerp(grab_point.global_basis, interpolation_speed * delta)
