extends Node2D

const SPEED: int = 200

func _process(delta: float) -> void:
    position += transform.x * SPEED * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
    queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
    queue_free()
