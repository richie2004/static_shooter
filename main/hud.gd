extends Control

@onready var score_show = $Label
var main : Node3D

func _ready() -> void:
	main = get_parent().get_parent()
	process_mode = Node.PROCESS_MODE_PAUSABLE
func score_update():
	score_show.text =  str(main.score)
	
