extends "res://Scenes/Characters/Enemy/Enemy.gd"
class_name Slime, "res://assets/v1.1 dungeon crawler 16x16 pixel pack/enemies/slime/slime_idle_anim_f0.png"
var target: Node2D
var navigation: Navigation2D
var path: PoolVector2Array
onready var attack_distance: Area2D = $AttackDistance

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

func _on_VisionArea_body_entered(body: Node) -> void:
	if body.is_in_group('player'):
		target = body

func _on_AttackCooldown_timeout():
	attack()

func attack() -> void:
	var bodies = attack_distance.get_overlapping_bodies()
	if target in bodies && target.has_method('take_damage'):
		target.take_damage(3)
		print(target.health)
