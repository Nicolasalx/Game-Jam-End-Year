extends Control

func _on_button_pressed():
	Global.color1 = true
	get_tree().change_scene_to_file("res://scenes/level/level_2.tscn")
