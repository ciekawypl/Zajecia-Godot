extends Control


@onready var worlds: Array = [$WorldIcon, $WorldIcon2, $WorldIcon3]
var currentWorld = 0

func _on_return_pressed():
	SceneLoader.loadScene("res://menus/main menu/Main Menu.tscn")


func _ready():
	$PlayerSprite.position = worlds[currentWorld].global_position


func _input(event):
	if event.is_action_pressed("left") && currentWorld > 0:
		currentWorld -= 1
		$PlayerSprite.global_position = worlds[currentWorld].global_position
	if event.is_action_pressed("right") && currentWorld < worlds.size() - 1:
		currentWorld += 1
		$PlayerSprite.position = worlds[currentWorld].position
	
	
	if event.is_action_pressed("ui_accept"):
		if currentWorld == 0: 
			SceneLoader.loadScene("res://levels/test scene/Test Scene.tscn") 
		#elif current_world == 1:
			#Funkcje.loadin_screan_to_screan("")
		#elif  current_world == 2:
			#Funkcje.loadin_screan_to_screan("")
