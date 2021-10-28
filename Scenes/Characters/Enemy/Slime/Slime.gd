extends "res://Scenes/Characters/Enemy/Enemy.gd"
class_name Slime, "res://assets/v1.1 dungeon crawler 16x16 pixel pack/enemies/slime/slime_idle_anim_f0.png"
var target: Node2D
var navigation: Navigation2D
var path: PoolVector2Array

func _ready() -> void:
	health = 10
	max_speed = 30

func _process(delta: float) -> void:
	if path.size() > 1:
		mov_direction = path[1] - position
	if mov_direction.x > 0:
		animated_sprite.flip_h = false
	elif mov_direction.x < 0:
		animated_sprite.flip_h = true

func _on_PathUpdateTimer_timeout() -> void:
	if target != null:
		self.path = navigation.get_simple_path(position, target.position)
