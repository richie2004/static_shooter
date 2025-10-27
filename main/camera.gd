extends Node3D

@onready var camera: Camera3D = $Camera3D
@export var shoot_range: float = 200.0
@onready var gun = $Camera3D/gun_trial_1
var muzzle : Node3D
var rotation_y = 180
var rotation_x = 0
var invert_y = 1
var mouse_sensitivity = 0.0025

var muzzle_flash

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_process_unhandled_input(true)



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_y -= event.relative.x * mouse_sensitivity
		rotation_x -= event.relative.y * mouse_sensitivity
		rotation_x = clamp(rotation_x, deg_to_rad(-89), deg_to_rad(89)) 
		# Apply rotation (radians)
		self.rotation = Vector3(rotation_x, rotation_y, 0)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()


func shoot():

	
	
	var from = camera.global_position
	var to = from +- camera.global_transform.basis.z * shoot_range
	
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to )
	query.collide_with_areas= true
	query.collide_with_bodies = true
	query.exclude = [self]
	
	var result = space_state.intersect_ray(query)
	if result.size() > 0:
		var hit_pos = result.position
		var collider = result["collider"]
		var hit = collider.get_parent().get_parent()
		#var hit_normal = result.normal
		gun.shoot(hit_pos , hit)
		
	else:
		var hit_pos = to
		gun.shoot(hit_pos , null)

		#if hit is Target:
			#hit.destroy()
	
#func spawn_tracer( end_pos: Vector3, target_collider):
	#var start_pos = muzzle.global_position
#
	#var tracer = preload("res://Tracer.tscn").instantiate()
	#get_tree().current_scene.add_child(tracer)
#
	#tracer.look_at(end_pos)
#
	#tracer.global_position = start_pos
	#tracer.target_pos = end_pos
	#tracer.target_collider = target_collider
	#
	
