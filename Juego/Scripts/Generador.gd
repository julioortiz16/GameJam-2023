extends Node2D

# Área en la que se generarán los obstáculos
var spawn_area_rect = Rect2(Vector2(0, 0), Vector2(1000, 1000))

# Cantidad máxima de obstáculos que pueden generarse en el área
var max_obstacles = 5

func _ready():
	# Generar obstáculos al inicio
	generate_obstacles()

	# Configurar un temporizador para generar obstáculos periódicamente
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = 2.0  # ajusta el tiempo de espera según tus necesidades
	spawn_timer.one_shot = false
	add_child(spawn_timer)
	spawn_timer.start()

	# Conectar la señal del temporizador directamente en el editor
	spawn_timer.connect("timeout", self, "_on_SpawnTimer_timeout")

# Función llamada cuando el temporizador alcanza cero
func _on_SpawnTimer_timeout():
	# Generar obstáculos periódicamente
	generate_obstacles()

# Función para generar obstáculos
func generate_obstacles():
	# Calcular cuántos obstáculos existen actualmente
	var current_obstacles = get_child_count()

	# Calcular cuántos obstáculos más se pueden generar
	var remaining_obstacles = max_obstacles - current_obstacles

	# Generar los obstáculos restantes
	for i in range(remaining_obstacles):
		# Genera una nueva posición aleatoria dentro del área definida
		var new_position = Vector2(
			randf_range(spawn_area_rect.position.x, spawn_area_rect.end.x),
			randf_range(spawn_area_rect.position.y, spawn_area_rect.end.y)
		)

		# Instancia un nuevo obstáculo (CharacterBody2D) y agrégalo al escenario
		var new_obstacle = CharacterBody2D.new()
		add_child(new_obstacle)

		# Establece la posición del nuevo obstáculo en la nueva posición generada
		new_obstacle.position = new_position

