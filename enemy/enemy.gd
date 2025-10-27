extends Node3D

var direction = Vector3(0.05,0,0)

func _physics_process(_delta: float) -> void:
	if  position.x > 3:
		direction = Vector3(-0.05, 0, 0)
	elif position.x < -3:
		direction = Vector3(0.05,0,0)
	position += direction
