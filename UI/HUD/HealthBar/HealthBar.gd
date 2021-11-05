extends MarginContainer

onready var progress_bar: TextureProgress = $HBoxContainer/MarginContainer/ProgressMargin/Progress
onready var tween: Tween = $Tween

var tween_speed: float = 0.5

func set_progress(health: int) -> void:
	tween.interpolate_property(
		progress_bar, "value",
		progress_bar.value, health, tween_speed)
	tween.start()

func set_progress_max(m: int) -> void:
	progress_bar.max_value = m
	set_progress(m)
