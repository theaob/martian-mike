extends Node2D

@export var nextLevel: PackedScene = null

@onready var start = $Start
@onready var exit = $Exit
@onready var deathZone = $DeathZone

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	reset_player()
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)
	
	exit.body_entered.connect(_on_exit_body_entered)
	deathZone.body_entered.connect(_on_death_zone_body_entered)

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

func _on_exit_body_entered(body):
	if body is Player:
		exit.animate()
		player.active = false
		await get_tree().create_timer(1.5).timeout
		get_tree().call_deferred("change_scene_to_packed", nextLevel)
