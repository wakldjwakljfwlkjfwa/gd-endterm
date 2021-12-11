extends CanvasLayer

func _on_NewButton_pressed():
	ConfigGame.game.level_create()
	$Control.hide()


func _on_QuitButton_pressed():
	get_tree().quit()
