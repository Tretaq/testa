extends Node2D
var ammo = Global.ammo
const BULLET = preload("res://bullet/bullet.tscn")
@onready var muzzle: Marker2D = $Marker2D
func _process(delta: float) -> void:
    look_at(get_global_mouse_position())
    
    rotation_degrees = wrap(rotation_degrees, 0, 360)
    if rotation_degrees > 90 and rotation_degrees < 270:
        scale.y = -1
    else:
        scale.y = 1
    if Input.is_action_just_pressed("fire") and ammo > 0:
            ammo -= 1
            Global.ammo = ammo
            print(Global.ammo)
            var bullet_instance = BULLET.instantiate()
            get_tree().root.add_child(bullet_instance)
            bullet_instance.global_position = muzzle.global_position
            bullet_instance.rotation = rotation
