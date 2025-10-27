extends Node

class_name Target

var health: int

func destroy():
	var manager = get_parent()
	manager.on_target_destroy()
	queue_free()
