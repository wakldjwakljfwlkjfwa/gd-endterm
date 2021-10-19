extends MarginContainer

onready var progress_bar: ProgressBar = $HBoxContainer/MarginContainer/ProgressBar
onready var tween: Tween = $Tween

func set_health(health: int) -> void:
	print("take damage")
	tween.interpolate_property(
		progress_bar, "value",
		progress_bar.value, health, 1)
	tween.start()
