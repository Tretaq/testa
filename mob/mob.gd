extends CharacterBody2D

const SPEED = 10

@export var point: Area2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta: float):
    var dir = to_local(nav_agent.get_next_path_position()).normalized()
    velocity = dir * SPEED
    move_and_slide()

func makepath() -> void:
    nav_agent.target_position = point.global_position

func _on_timer_timeout() -> void:
    makepath()
