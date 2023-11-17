extends CharacterBody2D


var speed = 200  # Velocidad del personaje
var velocity1 = Vector2()  # Vector de velocidad

func _process(delta):
	# Manejar eventos de teclado
	var direction = Vector2()  # Inicializar un vector de dirección

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalizar el vector de dirección para mantener la misma velocidad en todas las direcciones
	direction = direction.normalized()

	# Calcular la velocidad del personaje
	velocity1 = direction * speed

func _physics_process(delta):
	# Mover el personaje directamente sin move_and_slide
	position += velocity1 * delta
