extends Control

@onready var label_vidas = $LabelVidas

func _ready():
	actualizar_texto_vidas(Global.vidas)

func actualizar_texto_vidas(cantidad):
	if label_vidas: 
		label_vidas.text = "Vidas: " + str(cantidad)
