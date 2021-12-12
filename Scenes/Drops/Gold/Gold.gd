extends "res://Scenes/Drops/Drop.gd"

export(int) var amount: int = 0

func _init():
	._init()
	connect("pickedup", PlayerData, "add_coins")

func pickedup(body) -> void:
	.pickedup(body)
	if (body.is_in_group("player")):
		emit_signal("pickedup", amount)
		queue_free()
