extends Node
var is_paused = false
func set_paused(p):
	is_paused = p
	get_tree().paused = p
