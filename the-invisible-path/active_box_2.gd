extends StaticBody2D

@onready var collision_shape = $CollisionShape2D
@onready var colorRect = $ColorRect

var is_active = true

func _ready():
	update_box_state()

func _process(_delta):
	if Input.is_action_just_pressed("toggle_box"):
		is_active = !is_active
		update_box_state()

func update_box_state():
	collision_shape.disabled = is_active
	colorRect.modulate.a = 0.5 if is_active else 1.0
