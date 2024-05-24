extends Node


func loadScene(target: String) -> void:
	var loadingScreen = preload("res://menus/loading screen/Loading Screen.tscn").instantiate()
	loadingScreen.nextScene = target
	get_tree().current_scene.add_child(loadingScreen)
