extends CharacterBody2D

var speed = 500
var gravity = speed / 15
var jump = speed * 1.5
var direction :Vector2


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
	direction.x = Input.get_axis("left", "right")
	velocity.x = direction.x * speed
	
	if not is_on_floor():
		velocity.y += gravity
	
	if is_on_floor() and Input.is_action_pressed("up"):
		velocity.y -= jump
	
	
	move_and_slide()
	playAnimations()
