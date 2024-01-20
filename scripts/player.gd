extends CharacterBody2D

@export var gravity = 400;
@export var speed = 125;
@export var jump_velocity = 400.0

const GRAVITY_CAP = 500

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	if !is_on_floor(): 
		velocity.y += delta * gravity
		if velocity.y >= GRAVITY_CAP:
			velocity.y = GRAVITY_CAP
	
	# left -1 right 1 still 0
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	
	var jumpPressed = Input.is_action_just_pressed("jump")
	
	if jumpPressed: velocity.y += -jump_velocity
	
	
	move_and_slide()
