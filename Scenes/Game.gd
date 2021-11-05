extends Node2D

func _ready():
	$BasicRoom/Slime.navigation = $Navigation2D
	$HUD/HealthBar.set_progress_max($BasicRoom/Player.health_max)
	$BasicRoom/Player.connect("hit", $HUD/HealthBar, "set_progress")

func _init() -> void:
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)
