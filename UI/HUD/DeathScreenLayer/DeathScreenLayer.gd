extends Control

func _ready():
	hide()

func _on_NewButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	hide()

func _on_QuitButton_pressed():
	get_tree().quit()
