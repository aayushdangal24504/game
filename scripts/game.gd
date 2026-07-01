extends Node2D

func _ready():
	get_tree().paused = false

func _unhandled_input(event):
	if event.is_action_pressed("pause") or event.is_action_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
