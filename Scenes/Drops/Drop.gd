extends RigidBody2D

signal pickedup
	
func _ready():
	linear_damp = 7
	apply_central_impulse(Vector2(randi(), randi()).normalized() * 100)

func init():
	pass

func _on_PullArea_body_entered(body):
	pass # Replace with function body.


func _on_PullArea_body_exited(body):
	pass # Replace with function body.


func _on_PickArea_body_entered(body):
	pickedup(body)

func pickedup(body) -> void:
	pass
