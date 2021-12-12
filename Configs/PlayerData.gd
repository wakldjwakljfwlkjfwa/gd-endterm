extends Node

signal score_updated

var coins: float = 0.0
var score: int = 0

func add_score(val: int) -> void:
	score += val
	emit_signal("score_updated", score)
