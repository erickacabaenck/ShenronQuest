extends Node2D

@onready var move = $default

func _ready() -> void:
	$ani_ene_dyn.play("move")
