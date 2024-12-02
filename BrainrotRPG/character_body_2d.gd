extends CharacterBody2D

var SPEED = 100.0
var last_direction = "down"  # Domyślny kierunek bezczynności

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("idle_down")  # Domyślna animacja bezczynności

func _physics_process(delta):
	velocity = Vector2()
	var is_moving = false
	
	# Wykrywanie kierunku ruchu
	if Input.is_action_pressed("up"):
		velocity.y -= SPEED
		sprite.play("back_walk")
		last_direction = "back"
		is_moving = true
	elif Input.is_action_pressed("down"):
		velocity.y += SPEED
		sprite.play("front_walk")
		last_direction = "front"
		is_moving = true
	elif Input.is_action_pressed("left"):
		velocity.x -= SPEED
		sprite.play("left_walk")
		last_direction = "left"
		is_moving = true
	elif Input.is_action_pressed("right"):
		velocity.x += SPEED
		sprite.play("right_walk")
		last_direction = "right"
		is_moving = true
	
	# Animacja bezczynności, gdy brak ruchu
	if not is_moving:
		sprite.play(last_direction)

	# Poruszanie postaci
	move_and_slide()
