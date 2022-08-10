extends Control

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_TestButton_pressed():
	get_tree().change_scene("res://ui/ViewTeamWindow.tscn")

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://ui/ViewTeamWindow.tscn")
