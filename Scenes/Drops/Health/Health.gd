extends "res://Scenes/Drops/Drop.gd"

var amount := 3

func pickedup(body) -> void:
	.pickedup(body)
	if (body.is_in_group("player")):
		body.add_health(amount)
		queue_free()
