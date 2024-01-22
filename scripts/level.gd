extends Node2D

@onready var start = $Start
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	reset_player()
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)

func _process(_delta):
	var quitPressed = Input.is_action_pressed("quit")
	var resetPressed = Input.is_action_pressed("reset")
	
	if quitPressed: get_tree().quit()
	if resetPressed: get_tree().reload_current_scene()
	
func _on_death_zone_body_entered(_body):
	reset_player()

func _on_trap_touched_player():
	reset_player() # Replace with function body.
	
func reset_player():
	if player != null:
		player.velocity = Vector2.ZERO
		player.global_position = start.get_spawn_position()
