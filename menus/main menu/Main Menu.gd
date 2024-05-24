extends Control


func _on_start_pressed():
	SceneLoader.loadScene("res://menus/level select/Level Select.tscn")


func _on_quit_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit(0)
