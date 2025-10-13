extends CharacterBody2D

func _physics_process(delta):
    var direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
    velocity = direction * 600
    move_and_slide()