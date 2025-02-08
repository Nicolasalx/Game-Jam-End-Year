extends StaticBody2D

@onready var collision_shape = $CollisionShape2D
@onready var colorRect = $ColorRect

func _ready():
	update_box_state()

func _process(_delta):
	update_box_state()

func update_box_state():
	collision_shape.disabled = !Global.color1
	colorRect.modulate.a = 1.0 if Global.color1 else 0.5
