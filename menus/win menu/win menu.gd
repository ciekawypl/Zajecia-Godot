extends Control




func _on_button_pressed():
	get_tree().paused = false
	SceneLoader.loadScene("res://menus/level select/Level Select.tscn")
