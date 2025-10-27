extends Node

@export var Target_scene: PackedScene
@export var spawn_area_size : Vector3 = Vector3(5, 3, 2)
@export var spawn_distance: float = 10
var spawn_height : float = 2.5
var current_target: Node3D = null
var main: Node3D

func _ready() -> void:
	main = get_parent()
	
	
	
func spawn_target():
	if current_target and current_target.is_inside_tree():
		current_target.queue_free()
	
	var random_x = randf_range(-spawn_area_size.x/2,spawn_area_size.x/2)
	var random_z = randf_range(-spawn_area_size.z/2,spawn_area_size.z/2)
	var random_y = randf_range(-spawn_area_size.y/2,spawn_area_size.y/2)
	var position = Vector3(random_x, random_y + spawn_height, random_z + spawn_distance)
	current_target = Target_scene.instantiate()
	add_child(current_target)
	current_target.global_position = position
	
	

func on_target_destroy():
	main.score += 1
	main.update_score_M()
	spawn_target()
