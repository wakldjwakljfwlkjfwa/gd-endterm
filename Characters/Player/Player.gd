extends Character

onready var sword: Node2D = get_node("Sword")
onready var sword_animation_player: AnimationPlayer = sword.get_node("SwordAnimationPlayer")

func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0:
		animated_sprite.flip_h = true
		
	sword.rotation = mouse_direction.angle()
	if sword.scale.y == 1 and mouse_direction.x < 0:
		sword.scale.y = -1
	elif sword.scale.y == -1 and mouse_direction.x > 0:
		sword.scale.y = 1
	if Input.is_action_just_pressed("ui_attack") and not sword_animation_player.is_playing():
		sword_animation_player.play("attack")
		var sword_area: Area2D = sword.get_node("SwordHitArea")
		for body in sword_area.get_overlapping_bodies():
			if body.is_in_group("enemies"):
				print(body)
				body.take_damage(3)

func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
