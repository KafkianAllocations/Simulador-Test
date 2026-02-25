extends RigidBody3D

# Simple interactable object script
# When grabbed, it's frozen by the ToolController

func _ready():
	# Make sure it can sleep and be continuous for physics
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.friction = 0.5
	physics_material_override.bounce = 0.2
