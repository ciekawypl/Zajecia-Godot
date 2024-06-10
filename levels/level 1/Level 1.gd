extends Node2D

var Win = 0

func _on_player_coin_collected():
	$Label.text = "Coins: " + str($Player.coins)




func _on_door_2_win_condition():
	Win += 1
func _on_door_2_no_win_condition():
	Win -= 1
func _on_door_no_win_condition():
	Win -= 1
func _on_door_win_condition():
	Win += 1

func testWinCondition():
	if Win ==2:
		get_node("CanvasLayer/win menu").show()
		
func _process(delta):
	testWinCondition()
