extends Control

func  resume():
	get_tree().paused = false
func pause():
	get_tree().paused = true


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()
	hide()


func _on_quit_pressed():
	resume()
	hide()
	SceneLoader.loadScene("res://menus/level select/Level Select.tscn")
