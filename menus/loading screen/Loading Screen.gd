extends Control


@export_file("*.tscn") var nextScene: String

func _ready():
	ResourceLoader.load_threaded_request(nextScene)


func _process(delta):
	if ResourceLoader.load_threaded_get_status(nextScene) == ResourceLoader.THREAD_LOAD_LOADED:
		set_process(false)
		await get_tree().create_timer(0.5).timeout
		#var newScene: PackedScene = ResourceLoader.load_threaded_get(nextScene)
		#get_tree().change_scene_to_packed(newScene)
		get_tree().change_scene_to_file(nextScene)
