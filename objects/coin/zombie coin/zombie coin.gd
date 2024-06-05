extends Area2D


func _ready():
	modulate = Color.GREEN
	$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	if body.player_name == "Zombie":
		$CollisionShape2D.set_deferred("disabled", true)
		body.onCoinCollision()
		$AnimationPlayer.play("Pickup")
