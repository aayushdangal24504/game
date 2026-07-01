extends Node

var play_btn = null

func _ready():
	play_btn = get_node_or_null("UI/MainUI/CenterBox/VBox/PlayButton")
	if play_btn == null:
		play_btn = find_child("PlayButton", true, false)
	if play_btn != null:
		play_btn.pressed.connect(_on_play_pressed)
		play_btn.grab_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		_on_play_pressed()
