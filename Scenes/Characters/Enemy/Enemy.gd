extends "res://Scenes/Characters/Character.gd"

var navigation: Navigation2D

func die() -> void:
	.die()
	queue_free()
