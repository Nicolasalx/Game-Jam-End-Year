extends Node2D

@onready var colorRect = $ColorRect
@onready var label = $Label
@onready var labelChrono = $Chrono

const max_time = 25
var time_left = max_time

var is_white = true

func _ready():
	labelChrono.text = str(time_left)

func _process(delta):
	if Input.is_action_just_pressed("toggle_box"):
		if is_white:
			colorRect.modulate.r = 0
			colorRect.modulate.g = 0
			colorRect.modulate.b = 0
			label.add_theme_color_override("font_color", Color(1, 1, 1, 1))
			labelChrono.add_theme_color_override("font_color", Color(1, 1, 1, 1))
			is_white = false
		else:
			colorRect.modulate.r = 1.0
			colorRect.modulate.g = 1.0
			colorRect.modulate.b = 1.0
			is_white = true
			label.add_theme_color_override("font_color", Color(0, 0, 0, 1))
			labelChrono.add_theme_color_override("font_color", Color(0, 0, 0, 1))

	if !Global.alive:
		time_left = max_time
	if time_left > 0:
		time_left -= delta
		labelChrono.text = str(int(time_left + 0.5))
	else:
		Global.alive = false
		time_left = max_time
