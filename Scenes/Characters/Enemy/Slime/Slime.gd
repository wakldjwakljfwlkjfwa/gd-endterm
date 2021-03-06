extends "res://Scenes/Characters/Enemy/Enemy.gd"
class_name Slime, "res://assets/v1.1 dungeon crawler 16x16 pixel pack/enemies/slime/slime_idle_anim_f0.png"
var target: Node2D
var path: PoolVector2Array
var is_stunned: bool = false
onready var attack_distance: Area2D = $AttackDistance
onready var attack_cooldown: Timer = $AttackCooldown
onready var stun_timer: Timer = $StunTimer

func _init():
	drops_collection = [
		{"min": 0, "max": 4, "drop": preload("res://Scenes/Drops/Gold/Gold.tscn")}
	]

func _ready() -> void:
	health = 10
	max_speed = 30

func _process(delta: float) -> void:
	if is_stunned:
		mov_direction = Vector2()
	elif path.size() > 1:
		mov_direction = path[1] - position
	if mov_direction.x > 0:
		animated_sprite.flip_h = false
	elif mov_direction.x < 0:
		animated_sprite.flip_h = true

func _on_PathUpdateTimer_timeout() -> void:
	if target != null:
		self.path = navigation.get_simple_path(position, target.position)

func _on_VisionArea_body_entered(body: Node) -> void:
	if body.is_in_group('player') && body.is_targetable:
		target = body
		target.connect("died", self, "_on_target_died")
		attack_cooldown.start()

func _on_target_died():
	attack_cooldown.stop()
	target = null

func _on_AttackCooldown_timeout() -> void:
	if !is_stunned:
		attack()

func _on_StunTimer_timeout():
	is_stunned = false
	
func stun() -> void:
	stun_timer.start()
	is_stunned = true

func take_damage(damage: int, dir: Vector2 = Vector2(), force: float = 0.0) -> void:
	.take_damage(damage, dir, force)
	stun()

func attack() -> void:
	var bodies = attack_distance.get_overlapping_bodies()
	if target in bodies && target.has_method('take_damage'):
		target.take_damage(3)

func die() -> void:
	.die()
