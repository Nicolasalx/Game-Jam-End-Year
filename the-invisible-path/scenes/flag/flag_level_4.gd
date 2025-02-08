extends Node2D

@onready var colorRect = $ColorRect
@onready var textureRect = $TextureRect
@onready var label = $Label

func _ready():
	pass

func _process(delta):
	if Global.color1:
		colorRect.color = Color(0, 0, 0, 1)
		textureRect.modulate = Color(0, 0, 0, 1)
		label.add_theme_color_override("font_color", Color(0, 0, 0, 1))
	else:
		colorRect.color = Color(1, 1, 1, 1)
		textureRect.modulate = Color(1, 1, 1, 1)
		label.add_theme_color_override("font_color", Color(1, 1, 1, 1))

func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://scenes/inter_level/level_4_to_3.tscn")
