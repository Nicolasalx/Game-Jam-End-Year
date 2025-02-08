extends Node2D

@onready var peakText = $TextureRect

func _ready():
	pass

func _process(delta):
	if !Global.color1:
		peakText.modulate.r = 1
		peakText.modulate.g = 1
		peakText.modulate.b = 1
	else:
		peakText.modulate.r = 0
		peakText.modulate.g = 0
		peakText.modulate.b = 0

func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.alive = false
