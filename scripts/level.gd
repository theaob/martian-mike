extends Node2D

@onready var start_position = $StartPosition

func _process(_delta):
	var quitPressed = Input.is_action_pressed("quit")
	var resetPressed = Input.is_action_pressed("reset")
	
	if quitPressed: get_tree().quit()
	if resetPressed: get_tree().reload_current_scene()
	
	pass


func _on_death_zone_body_entered(body):
	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position
