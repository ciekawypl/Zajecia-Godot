extends Area2D

signal plateActivated

@export var player_name : String
var player_counter = 0

func _ready():
	if not player_name.is_empty():
		if player_name == "Zombie":
			modulate = Color.GREEN
		if player_name == "Ghost":
			modulate = Color.CYAN


func _on_body_entered(body):
	if player_name.is_empty():
		player_counter += 1
		if player_counter == 1:
			$AnimatedSprite2D.play("press")
			plateActivated.emit()
	else:
		if body.player_name == player_name:
			$AnimatedSprite2D.play("press")
			plateActivated.emit()


func _on_body_exited(body):
	if player_name.is_empty():
		player_counter -= 1
		if player_counter == 0:
			$AnimatedSprite2D.play_backwards("press")
			plateActivated.emit()
	else:
		if body.player_name == player_name:
			$AnimatedSprite2D.play_backwards("press")
			plateActivated.emit()
