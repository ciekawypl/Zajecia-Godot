extends Node2D


func _on_player_coin_collected():
	$Label.text = "Coins: " + str($Player.coins)
