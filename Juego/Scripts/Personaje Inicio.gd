extends CharacterBody2D


const SPEED = 300.0

func _process(delta):
	var posicion = Vector2()
	if Input.is_action_pressed("ui_right"):
		posicion.x += 1
	if Input.is_action_pressed("ui_left"):
		posicion.x -= 1
	if Input.is_action_pressed("ui_down"):
		posicion.y += 1
	if Input.is_action_pressed("ui_up"):
		posicion.y -= 1
