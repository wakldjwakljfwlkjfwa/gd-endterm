extends CanvasLayer

func _ready():
	pass

func update_health(health: int) -> void:
	$HealthBar.set_progress(health)

func update_score(val: int) -> void:
	$ScoreLabel.update_text(val)
