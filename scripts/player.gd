extends CharacterBody2D

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
	if is_on_floor() && jumpPressed: velocity.y += -jump_velocity
	
	velocity.x = direction * speed
	
	move_and_slide()
