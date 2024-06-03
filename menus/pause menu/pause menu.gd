extends Control


func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true


func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
		show()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		hide()




func _on_resume_pressed():
	resume()
	hide()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()
	hide()


func _on_quit_pressed():
	resume()
	SceneLoader.loadScene("res://menus/level select/Level Select.tscn")
	hide()

func _process(delta):
	testEsc()
