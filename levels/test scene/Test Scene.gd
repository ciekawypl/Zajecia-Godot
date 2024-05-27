extends Node2D


func _on_gracz_coin_collected():
	$Label.text = "Coins: " + str($Player.coins)
