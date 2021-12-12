extends KinematicBody2D
class_name Character, "res://assets/v1.1 dungeon crawler 16x16 pixel pack/heroes/knight/knight_idle_anim_f0.png"

const FRICTION: float = 0.15

export(int) var acceleration: int = 40 
export(int) var max_speed: int = 100
export(int) var knockback_force: int = 600

onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")
onready var state_machine: Node = get_node("FiniteStateMachine")

var knockback_direction: Vector2 = Vector2.ZERO
var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var health: int = 0
var health_max: int = 0
var is_targetable = true

func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func initialize(health_max: int = 10) -> void: 
	self.health_max = health_max
	self.health = health_max

func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.clamped(max_speed)

func die() -> void:
	pass
	
func take_damage(damage: int, dir: Vector2 = Vector2(), force: float = 0.0) -> void:
	health -= damage
	animation_player.play("damaging")
	velocity += dir * force
	if health <= 0:
		animation_player.play("died")
