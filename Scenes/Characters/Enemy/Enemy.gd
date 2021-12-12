extends "res://Scenes/Characters/Character.gd"

export(int) var score = 0

var navigation: Navigation2D

func die() -> void:
	PlayerData.add_score(score)
	.die()
	queue_free()
