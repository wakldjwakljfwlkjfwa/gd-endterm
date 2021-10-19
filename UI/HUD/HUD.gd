extends CanvasLayer

var health = 100

func _ready():
	$HealthBar.set_health(health)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		health -= 25
		$HealthBar.set_health(health)
