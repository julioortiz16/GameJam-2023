extends CharacterBody2D


# Configuración del espacio en el que se generarán los obstáculos
var spawn_area_rect = Rect2(Vector2(0, 0), Vector2(1000, 1000))

# Prefab del obstáculo (asegúrate de tener un recurso CharacterBody2D en tu escena)
var obstacle_prefab = preload("res://Escenas/Obstaculo.tscn")

func _ready():
	# Llama a la función para generar un obstáculo al inicio
	_spawn_obstacle()

	# Configura un temporizador si deseas que se sigan generando obstáculos a intervalos
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = 2.0  # ajusta el tiempo de espera según tus necesidades
	spawn_timer.one_shot = false
	spawn_timer.connect("timeout", self, "_on_SpawnTimer_timeout")
	add_child(spawn_timer)
	spawn_timer.start()

# Función llamada cuando el temporizador alcanza cero
func _on_SpawnTimer_timeout():
	# Llama a la función para generar un obstáculo
	_spawn_obstacle()

# Función para generar un obstáculo
func _spawn_obstacle():
	# Genera una nueva posición aleatoria dentro del área definida
	var new_position = Vector2(
		randf_range(spawn_area_rect.position.x, spawn_area_rect.end.x),
		randf_range(spawn_area_rect.position.y, spawn_area_rect.end.y)
	)

	# Instancia un nuevo obstáculo desde el prefab
	var new_obstacle = obstacle_prefab.instance()

	# Establece la posición del nuevo obstáculo en la nueva posición generada
	new_obstacle.position = new_position

	# Agrega el nuevo obstáculo al escenario
	get_tree().get_root().add_child(new_obstacle)

