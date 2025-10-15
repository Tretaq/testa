extends CharacterBody2D
@onready var animaterd_sprite = $AnimatedSprite2D
func _physics_process(delta):
    var direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
    velocity = direction * 100

    move_and_slide()
