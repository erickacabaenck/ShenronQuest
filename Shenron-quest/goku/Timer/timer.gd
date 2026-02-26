extends Control  # <--- CAMBIA ESTO (Antes era Node2D)

signal timeout
signal started

@export var segundos: float = 420.0 
@export var loop: bool = false

@onready var label: Label = $HBoxContainer/Label 

var tiempoRestante: float
var is_running: bool = false

func _ready():
	tiempoRestante = segundos
	actualizar_interfaz()
	start()

func start():
	is_running = true
	emit_signal("started")

func _process(delta: float) -> void:
	if not is_running:
		return
		
	tiempoRestante -= delta
	
	if tiempoRestante <= 0:
		tiempoRestante = 0
		is_running = false
		emit_signal("timeout")
		if loop:
			restart()
		else:
			set_process(false) 
	
	actualizar_interfaz()

func actualizar_interfaz():
	if is_instance_valid(label):
		var mins = int(tiempoRestante) / 60
		var secs = int(tiempoRestante) % 60
		label.text = "%02d:%02d" % [mins, secs]

func restart():
	tiempoRestante = segundos
	is_running = true
	set_process(true)
