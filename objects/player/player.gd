extends CharacterBody2D

@export var player_name : String

var left_button : String
var up_button : String
var right_button : String

var speed = 500
var gravity = speed / 15
var jump = speed * 1.5
var direction :Vector2
var push_force= 80

@export var coins = 0
signal coinCollected

func _ready():
	if not player_name.is_empty():
		if player_name == "Zombie":
			modulate = Color.GREEN
			left_button = "left"
			up_button = "up"
			right_button = "right"
		if player_name == "Ghost":
			modulate = Color.CYAN
			left_button = "a"
			up_button = "w"
			right_button = "d"

func onSpikeColision():
	$"../CanvasLayer/lose menu".show()

func onDoorColision():
	$"../CanvasLayer/win menu".show()

func onCoinCollision():
	coins += 1
	coinCollected.emit()


func playAnimations():
	if not is_on_floor():
		if velocity.y > 0:
			$Marker2D/AnimatedSprite2D.play("Fall")
		else:
			$Marker2D/AnimatedSprite2D.play("Jump")
	elif direction:
		$Marker2D/AnimatedSprite2D.play("Run")
	else:
		$Marker2D/AnimatedSprite2D.play("Idle")
	
	if direction.x < 0:
		$Marker2D.scale.x = -1
	elif direction.x > 0:
		$Marker2D.scale.x = 1

func _process(delta):
	direction.x = Input.get_axis(left_button, right_button)
	velocity.x = direction.x * speed
	
	if not is_on_floor():
		velocity.y += gravity
	
	if is_on_floor() and Input.is_action_pressed(up_button):
		velocity.y -= jump
	
	
	move_and_slide()
	playAnimations()
#Lupa do kolizji RigidBody2D
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force )
