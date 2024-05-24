extends Node2D

@export var title :String

func _ready():
	$Label.text = title
