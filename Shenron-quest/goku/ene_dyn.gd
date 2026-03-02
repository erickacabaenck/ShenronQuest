extends CharacterBody2D

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed = 100

var sentido = 1

func _ready():
	$ani_ene.play("default")

func _physics_process(delta):

	# gravedad
	velocity.y += gravity * delta

	# si choca con una pared se da la vuelta
	if is_on_wall():
		sentido = -sentido

	# movimiento hacia la derecha
	if sentido == 1 and $detectorIzquierdo.is_colliding():
		velocity.x = speed
		$ani_ene.flip_h = false
	else:
		sentido = -1

	# movimiento hacia la izquierda
	if sentido == -1 and $detectorDerecho.is_colliding():
		velocity.x = -speed
		$ani_ene.flip_h = true
	else:
		sentido = 1

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugadores"):
		body.morir()
