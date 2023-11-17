extends CharacterBody2D

const jumpHeight = -500
const gravity = 9999999999999999

@onready var sprite = $SkibidiPlayer
@onready var animationPlayer = $AnimationPlayer
var can_jump = false
var motion = Vector2(0, 0)
const up = Vector2(0, -1)

func _physics_process(delta):
	motion.y += gravity * delta
	#var friction = false
	
	if can_jump and Input.is_action_pressed("ui_accept"):
		animationPlayer.play("Work")
		motion.y = jumpHeight
		can_jump = false
		
	else:
		animationPlayer.play("Idle")
		#friction = true
		
		
	#if is_on_floor():
	#	if Input.is_action_pressed("ui_accept"):
	#		motion.y = jumpHeight
	#	if friction == true:
	#		motion.x = lerp(motion.x, 0, 0.5)
	#		
	#else:
	#	if friction == true:
	#		motion.x = lerp(motion.x, 0, 0.5)
	move_and_collide(motion)
	
func _on_FloorDetector_body_entered(body):
	can_jump = true
