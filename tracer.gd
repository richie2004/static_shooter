extends Node3D


@export var target_pos = Vector3(0,0,0)
@export var bullet_speed = 75
@export var tracer_length = 1
var target_collider
const max_lifetime = 5000

@onready var spawn_time = Time.get_ticks_msec()


func _process(delta: float) -> void:
	var diff = (target_pos - self.global_position)
	var add = diff.normalized() * bullet_speed * delta 
	add = add.limit_length(diff.length())
	self.global_position += add
	look_at(target_pos)
	if (target_pos - self.global_position).length() <= tracer_length or Time.get_ticks_msec() - spawn_time > max_lifetime:
		#print_debug(global_position)
		#print_debug(global_rotation)
		if target_collider is Target:
			print_debug(target_collider)
			target_collider.destroy()
		self.queue_free()
		
	
