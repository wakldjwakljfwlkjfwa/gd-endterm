extends Node2D

onready var rooms_container = $RoomsContainer

func _ready():
	ConfigGame.game = self
	
	var player = preload("res://Scenes/Characters/Player/Player.tscn").instance()
	player.connect("hit", $HUD/HealthBar, "set_progress")
	ConfigGame.player = player
	ConfigGame.entity_container = $EntityContainer
	ConfigGame.enemy_container = $EntityContainer/EnemyContainer
	ConfigGame.drop_container = $EntityContainer/DropContainer
	ConfigGame.navigation = $Navigation2D
	ConfigGame.hud = $HUD
	PlayerData.connect("score_updated", ConfigGame.hud, "update_score")
	
	$HUD/HealthBar.set_progress_max(player.health_max)

func _init() -> void:
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

func level_finished() -> void:
	level_create()

func level_create() -> void:
	for i in ConfigGame.enemy_container.get_children():
		i.queue_free()
	for i in ConfigGame.navigation.get_children():
		i.queue_free()
	for i in rooms_container.get_children():
		i.queue_free()
	var generation = preload("res://Scripts/ProcGen/Generate.gd").new()
	generation.init($Navigation2D, $RoomsContainer)
	generation.generate()
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
