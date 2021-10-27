extends "res://Scenes/Characters/Enemy/Enemy.gd"

var target: Node2D
var navigation: Navigation2D
var path: PoolVector2Array

func _ready() -> void:
	health = 10
	max_speed = 30

func _process(delta: float) -> void:
	if path.size() > 1:
		mov_direction = path[1] - position


func _on_PathUpdateTimer_timeout() -> void:
	if target != null:
		self.path = navigation.get_simple_path(position, target.position)
