extends RigidBody2D

@onready var colorRect = $ColorRect

func _ready():
	pass

func _process(delta):
	if !Global.color1:
		colorRect.color.r = 1
		colorRect.color.g = 1
		colorRect.color.b = 1
	else:
		colorRect.color.r = 0
		colorRect.color.g = 0
		colorRect.color.b = 0
