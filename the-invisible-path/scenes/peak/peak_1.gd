extends Node2D

@onready var peakText = $TextureRect

func _ready():
	pass

func _process(delta):
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.alive = false
	peakText.modulate.a = 1.0 if Global.color1 else 0.5
