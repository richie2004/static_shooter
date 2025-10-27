extends Control

@onready var resume_btn  = $VBoxContainer/resume
@onready var restart_btn = $VBoxContainer/restart
@onready var quit_btn    = $VBoxContainer/quit

func _ready():
	hide()  # start hidden
	process_mode = Node.PROCESS_MODE_ALWAYS

	# Connect buttons (you can also connect in the editor)
	resume_btn.connect("pressed", Callable(self, "_on_resume_pressed"))
	restart_btn.connect("pressed", Callable(self, "_on_restart_pressed"))
	quit_btn.connect("pressed", Callable(self, "_on_quit_pressed"))
	print($VBoxContainer/resume.is_hovered())
	
func show_menu():
	get_tree().paused = true
	show()
	# optional: show mouse cursor if you capture it during gameplay
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# hide HUD if it's a sibling
	if get_parent().has_node("HUD"):
		get_parent().get_node("HUD").hide()


func hide_menu():
	visible = false
	get_tree().paused = false

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if get_parent().has_node("HUD"):
		get_parent().get_node("HUD").show()

# Button callbacks
func _on_resume_pressed():
	hide_menu()


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
