extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		await get_tree().create_timer(0.2).timeout
		get_tree().paused = true
		body.onDoorColision()
