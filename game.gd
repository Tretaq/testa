extends Node2D

@export var ammo_pack_scene: PackedScene
@onready var spawn_area = $SpawnArea # Replace with the path to your Area2D node

func spawn_ammo_pack():
	var rect_size = spawn_area.get_node("CollisionShape2D").shape.extents * 2
	var rect_position = spawn_area.global_position - rect_size / 2

	var random_x = randf_range(rect_position.x, rect_position.x + rect_size.x)
	var random_y = randf_range(rect_position.y, rect_position.y + rect_size.y)
	var random_position = Vector2(random_x, random_y)

	var ammo_pack = ammo_pack_scene.instantiate()
	ammo_pack.global_position = random_position
	add_child(ammo_pack)

func _on_timer_timeout() -> void:
	randomize()
	spawn_ammo_pack()

func _on_point_health_depleted() -> void:
	Global.reset()
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
