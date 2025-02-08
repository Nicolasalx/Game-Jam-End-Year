extends StaticBody2D

@onready var colorRect = $ColorRect

var is_white = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("toggle_box"):
		if !is_white:
			colorRect.color.r = 1
			colorRect.color.g = 1
			colorRect.color.b = 1
			is_white = true
		else:
			colorRect.color.r = 0
			colorRect.color.g = 0
			colorRect.color.b = 0
			is_white = false
