extends Node


var ammo = 3
var elapsed_time = 0.0
func _process(delta: float) -> void:
    elapsed_time += delta

func reset():
    ammo = 3
    elapsed_time = 0.0