extends Area2D


func _ready():
	$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	if body.name == "Player":
		$CollisionShape2D.set_deferred("disabled", true)
		body.onCoinCollision()
		$AnimationPlayer.play("Pickup")

