extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 150
@export var jump_velocity = 250

const TERMINAL_VELOCITY = 500

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	# left -1 right 1 still 0
	var direction = Input.get_axis("move_left", "move_right")
	var jumpPressed = Input.is_action_just_pressed("jump")
	
	if not is_on_floor(): 
		velocity.y += delta * gravity
		clamp(velocity.y, TERMINAL_VELOCITY, -TERMINAL_VELOCITY)
		
	# jump only if on floor and input received
	if is_on_floor() && jumpPressed: jump(jump_velocity)
	
	velocity.x = direction * speed
	
	if direction != 0: animated_sprite.flip_h = (direction == -1)
	
	move_and_slide()
	update_animations(direction)
	
func update_animations(direction):
	
	if is_on_floor():
		if direction == 0: animated_sprite.play("idle")
		else: animated_sprite.play("run")
	else:
		if velocity.y < 0: animated_sprite.play("jump")
		else: animated_sprite.play("fall")
		
func jump(force):
	velocity.y = -force
