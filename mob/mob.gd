extends CharacterBody2D

const SPEED = 15.0
@onready var animated_sprite = $AnimatedSprite2D
@export var point: Area2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

var is_dead: bool = false

func _physics_process(delta: float):
	if is_dead:
		velocity = Vector2.ZERO

	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = point.global_position

func _on_timer_timeout() -> void:
	makepath()

func take_damage():
	if is_dead:
		return

	is_dead = true
	velocity = Vector2.ZERO
	animated_sprite.play("die")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
