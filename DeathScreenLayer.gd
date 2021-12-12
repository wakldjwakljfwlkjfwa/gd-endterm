extends CanvasLayer

func _on_NewButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	$Control.hide()


func _on_QuitButton_pressed():
	get_tree().quit()
