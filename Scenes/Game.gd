extends Node2D

func _ready():
	$BasicRoom/Slime.navigation = $Navigation2D
	$BasicRoom/Slime.target = $BasicRoom/Player
