extends CharacterBody2D

@export var speed = 500
@export var acceleration = 600
@export var gravity_scale = 2
@export var friction = 1500
@export var jump_force = -700
@export var air_acceleration = 2000
@export var air_friction = 700

@onready var ani_player = $AnimatedSprite2D

var atacar: bool = false

func _ready() -> void:
	add_to_group("jugadores")

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * gravity_scale * delta
		
func apply_friction(input_axis, delta):
	if input_axis==0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, friction*delta)

func handle_acceleration(input_axis, delta):
	if not is_on_floor(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, speed*input_axis, acceleration*delta)
		
func handle_jump():
	if is_on_floor():
		if Input.is_action_pressed("saltar"):
			velocity.y = jump_force
func handle_air_acceleration(input_axis, delta):
	if is_on_floor(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, speed*input_axis, air_acceleration *delta)

func update_animation(input_axis):
	if not is_on_floor():
		if ani_player.animation != "jump":
			ani_player.play("jump")
	elif input_axis != 0:
		ani_player.speed_scale = max(abs(velocity.x) / speed, 0.7)
		ani_player.flip_h = (input_axis < 0)
		if ani_player.animation != "run":
			ani_player.play("run")
	else:
		ani_player.speed_scale = 1
		if ani_player.animation != "idle":
			ani_player.play("idle")
			
func ejecutar_ataque():
	atacar = true
	ani_player.play("attack")
	await ani_player.animation_finished
	atacar = false
	
func _physics_process(delta: float) -> void:
	
	var input_axis = Input.get_axis("mover_izquierda","mover_derecha")
	apply_gravity(delta)
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	handle_jump()
	handle_air_acceleration(input_axis, delta)
	
	if Input.is_action_just_pressed("atacar") and not atacar:
		ejecutar_ataque()
	if not atacar:
		update_animation(input_axis)
		
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("agua"):
			morir()
## func add_moneda():
	## monedas+=1
	## contador.actualizar(monedas)
	
func morir():
	if not is_physics_processing(): 
		return
	set_physics_process(false)
	ani_player.play("dead")
	if has_node("tiempo"):
		$tiempo.start()
		await $tiempo.timeout
	$tiempo.start()
	await $tiempo.timeout
	if is_inside_tree():
		get_tree().reload_current_scene()
