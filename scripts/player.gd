extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	var rightPressed = Input.is_action_pressed("move_right")
	var leftPressed = Input.is_action_pressed("move_left")
	var jumpPressed = Input.is_action_pressed("jump")

	if rightPressed: animated_sprite.play("run")
	if leftPressed: animated_sprite.play("run")
	if jumpPressed: animated_sprite.play("jump")
