extends Node2D

@onready var peakText = $TextureRect

func _ready():
	pass

func _process(delta):
	peakText.modulate.a = 0.5 if Global.color1 else 1.0

func _on_area_2d_area_entered(area: Area2D) -> void:
	if (!Global.color1):
		Global.alive = false
