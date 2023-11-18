extends CharacterBody2D


var speed = 200  # Velocidad de movimiento


func _process(delta):
	# Obtener la entrada del teclado
	var velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Escenas/Menu.tscn")

	# Normalizar la velocidad para mantener la misma velocidad en todas las direcciones
	velocity = velocity.normalized()

	# Mover el personaje y manejar las colisiones
	var collision_info = move_and_collide(velocity * speed * delta)

	if collision_info:
		# Hubo una colisión, establecer la velocidad a cero para detener al jugador
		velocity = Vector2.ZERO
		# Hubo una colisión, ajustar la posición para evitar la superposición
		
	else:
		# No hubo colisión, moverse normalmente
		position += velocity * speed * delta
