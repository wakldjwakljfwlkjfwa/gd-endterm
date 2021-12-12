extends RigidBody2D

signal pickedup

export(int) var amount: int = 0

func _init():
	connect("pickedup", PlayerData, "add_coins")
	
func _ready():
	pass

func init():
	pass

func _on_PullArea_body_entered(body):
	pass # Replace with function body.


func _on_PullArea_body_exited(body):
	pass # Replace with function body.


func _on_PickArea_body_entered(body):
	if (body.is_in_group("player")):
		emit_signal("pickedup", amount)
		queue_free()
