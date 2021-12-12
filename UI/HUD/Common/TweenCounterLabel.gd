extends Label

onready var tween: Tween = $Tween
var tween_speed := 0.5
var val: int = 0

func _process(delta: float) -> void:
	text = str(val)

func update_text(val: int) -> void:
	tween.interpolate_property(self, "val", self.val, val, tween_speed)
	tween.start()
