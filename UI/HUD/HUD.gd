extends CanvasLayer

func _ready():
	pass

func update_health(health: int) -> void:
	$HealthBar.set_progress(health)
