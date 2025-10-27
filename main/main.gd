extends Node3D

@onready var Game_manager: Node =$game_manager
@onready var spawner: Node=$spawner
@onready var UI: CanvasLayer =$UI
@export var score : int = 0
@export var hud: Control
@export var pause_menu : Control
@onready var camera_main =$player/Camera_rig/Camera3D
@onready var camera_alt = $camera_alt
func _ready() -> void:
	spawner.spawn_target()
	hud = UI.get_node("HUD")
	pause_menu = UI.get_node("PauseMenu")
	
	#camera_main.current = false
	#camera_alt.current = true
	
func update_score_M():
	hud.score_update()

func _input(event):
	if event.is_action_pressed("pause"):  # uses the action you made
		if get_tree().paused:
			pause_menu.hide_menu()
		else:
			pause_menu.show_menu()
