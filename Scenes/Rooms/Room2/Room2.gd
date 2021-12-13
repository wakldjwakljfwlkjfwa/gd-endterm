extends "res://Scenes/Rooms/BaseRoom.gd"

var enemy_collection = [
	preload("res://Scenes/Characters/Enemy/Slime/Slime.tscn")
]

onready var enemy_spawn_container = $EnemySpawnContainer

func __init_after() -> void:
	for pos in enemy_spawn_container.get_children():
		if randi() % 2 == 0:
			var enemy = enemy_collection[randi() % enemy_collection.size()].instance()
			enemy.position = pos.global_position
			enemy.navigation = ConfigGame.navigation
			ConfigGame.enemy_container.add_child(enemy)
