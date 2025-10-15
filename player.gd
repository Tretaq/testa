extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = direction * 100
	var direction_horizontal = Input.get_axis("LEFT", "RIGHT")

	if direction_horizontal > 0:
		animated_sprite.flip_h = false
	elif direction_horizontal < 0:
		animated_sprite.flip_h = true

	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("move")

	move_and_slide()
