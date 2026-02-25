extends Node3D

@onready var camera = $Camera3D
@export var sens: float = 0.005

func _ready():
	# Initially capture mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Allow freeing mouse for UI
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# If we want the camera to look around, we do it here.
		# However, for the simulator, maybe we want the camera fixed,
		# and only the tool moves. We can comment this out or keep it optional.
		# rotation.y -= event.relative.x * sens
		# camera.rotation.x -= event.relative.y * sens
		# camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
		pass
