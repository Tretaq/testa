extends CharacterBody2D

 
const MAX_SPEED: int = 80
const ACCELERATION: int = 1400
const FRICTION: int = 1000
 
@onready var sprite = $AnimatedSprite2D
@onready var animated_sprite = $AnimatedSprite2D
 
 
func _process(delta: float) -> void:
	$Label.text = str(Global.ammo) + "  " + String("%.2f" % Global.elapsed_time)
	if get_global_mouse_position().x < global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
 
	var direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	if direction:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, ACCELERATION * delta)
		animated_sprite.play("move")
	else:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, FRICTION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, FRICTION * delta)
		animated_sprite.play("idle")
	
	move_and_slide()
