extends Node

signal score_updated
signal coins_updated

var coins: int = 0
var score: int = 0

func add_score(val: int) -> void:
	score += val
	emit_signal("score_updated", score)


func add_coins(val: int) -> void:
	coins += val
	emit_signal("coins_updated", coins)
