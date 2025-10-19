extends Area2D

var health = 100.0
signal health_depleted
func _process(delta: float) -> void:
    const DAMAGE_RATE = 4.0
    var overlapping_mobs = %HurtBox.get_overlapping_bodies()
    print(health)
    if overlapping_mobs.size() > 0:
        health -= DAMAGE_RATE * overlapping_mobs.size() * delta
        %ProgressBar.value = health
        if health <= 0.0:
            health_depleted.emit()
