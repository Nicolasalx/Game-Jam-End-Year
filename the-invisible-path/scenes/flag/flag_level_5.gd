extends Node2D

func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://scenes/inter_level/level_5_to_4.tscn")
