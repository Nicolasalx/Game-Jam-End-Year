extends Node2D

@onready var colorRect = $ColorRect
@onready var label = $Label

var is_white = true

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("toggle_box"):
		if is_white:
			colorRect.modulate.r = 0
			colorRect.modulate.g = 0
			colorRect.modulate.b = 0
			is_white = false
			label.add_theme_color_override("font_color", Color(1, 1, 1, 1))
		else:
			colorRect.modulate.r = 1.0
			colorRect.modulate.g = 1.0
			colorRect.modulate.b = 1.0
			is_white = true
			label.add_theme_color_override("font_color", Color(0, 0, 0, 1))
