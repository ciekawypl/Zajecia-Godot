extends PathFollow2D


var moved = false

func move():
	if moved:
		$AnimationPlayer.play_backwards("move")
	else:
		$AnimationPlayer.play("move")
	moved = !moved
