extends Area2D

signal WinCondition
signal NoWinCondition

@export var player_name: String




func _ready():
	if not player_name.is_empty():
		if player_name == "Zombie":
			modulate = Color.GREEN
		if player_name == "Ghost":
			modulate = Color.CYAN


func _on_body_entered(body):
	if body.is_in_group("Gracze"):
		if body.player_name == player_name:
			$AnimatedSprite2D.play("default")
			WinCondition.emit()


func _on_body_exited(body):
	if body.is_in_group("Gracze"):
		if body.player_name == player_name:
			$AnimatedSprite2D.play_backwards("default")
			NoWinCondition.emit()
		
