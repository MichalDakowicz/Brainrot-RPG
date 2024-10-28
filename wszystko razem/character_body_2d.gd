extends CharacterBody2D

var SPEED = 100.0
var VELOCITY = Vector2()

func _ready(): 
	pass

func _physics_process(delta):
	velocity=Vector2()
	
	if Input.is_action_pressed("down"): 
		velocity.y += SPEED
	elif Input.is_action_pressed("up"): 
		velocity.y -= SPEED
	elif Input.is_action_pressed("left"): 
		velocity.x -= SPEED
	elif Input.is_action_pressed("right"): 
		velocity.x += SPEED	
		
	move_and_slide()
