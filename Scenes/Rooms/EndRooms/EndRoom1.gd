extends "res://Scenes/Rooms/BaseRoom.gd"


func _on_Exit_area_entered(area: Area2D) -> void:
	ConfigGame.game.level_finished()
