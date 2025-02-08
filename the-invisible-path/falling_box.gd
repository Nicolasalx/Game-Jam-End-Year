extends RigidBody2D

@onready var colorRect = $TextureRect

func _ready():
	pass

func _process(delta):
	if !Global.color1:
		colorRect.modulate.r = 1
		colorRect.modulate.g = 1
		colorRect.modulate.b = 1
	else:
		colorRect.modulate.r = 0
		colorRect.modulate.g = 0
		colorRect.modulate.b = 0
