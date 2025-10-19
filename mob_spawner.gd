extends Node2D

@export var enemy_prefab: PackedScene
@export var target: Area2D
func _on_timer_timeout():
    if randi() % 5 == 0:
        var enemy = enemy_prefab.instantiate()
        enemy.point = target
        add_child(enemy)
