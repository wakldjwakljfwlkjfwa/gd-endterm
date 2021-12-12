extends "res://Scenes/Characters/Character.gd"

export(int) var score = 0

var drops_collection = []

var navigation: Navigation2D

func die() -> void:
	PlayerData.add_score(score)
#	drops_collection[randi() % drop]
	for drop in drops_collection:
		var minimum = drop["min"]
		var diff = drop["max"] - drop["min"]
		var amount = minimum + (randi() % diff)
		for i in range(amount):
			var d = drop["drop"].instance()
			d.position = position
			ConfigGame.drop_container.add_child(d)
	.die()
	queue_free()
