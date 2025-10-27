extends Node3D

@onready var muzzle = $Cube_002/muzzle
@onready var muzzle_flash = $Cube_002/muzzle/MuzzleFlash
@onready var animation_player = $AnimationPlayer


func shoot(end_pos : Vector3, target_collider):
	muzzle_flash.emitting = true
	animation_player.play("shoot")
	
	var start_pos = muzzle.global_position

	var tracer = preload("res://Tracer.tscn").instantiate()
	get_tree().current_scene.add_child(tracer)

	tracer.look_at(end_pos)

	tracer.global_position = start_pos
	tracer.target_pos = end_pos
	tracer.target_collider = target_collider
	
