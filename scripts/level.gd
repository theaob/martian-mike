extends Node2D

func _process(_delta):
	var quitPressed = Input.is_action_pressed("quit")
	var resetPressed = Input.is_action_pressed("reset")
	
	if quitPressed: get_tree().quit()
	if resetPressed: get_tree().reload_current_scene()
	
	pass
