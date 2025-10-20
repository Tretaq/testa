extends Control

func _ready():
    $AnimationPlayer.play("RESET")
    disable_buttons(true) # Disable buttons initially

func resume():
    get_tree().paused = false
    $AnimationPlayer.play_backwards("blur")
    disable_buttons(true) # Disable buttons when resuming

func pause():
    get_tree().paused = true
    $AnimationPlayer.play("blur")
    disable_buttons(false) # Enable buttons when paused

func testEsc():
    if Input.is_action_just_pressed("esc") and not get_tree().paused:
        pause()
    elif Input.is_action_just_pressed("esc") and get_tree().paused:
        resume()

func _on_resume_pressed() -> void:
    resume()

func _on_restart_pressed() -> void:
    Global.reset()
    resume()
    get_tree().reload_current_scene()

func _process(delta):
    testEsc()

# Helper function to enable/disable buttons
func disable_buttons(disable: bool) -> void:
    $PanelContainer/VBoxContainer/Resume.disabled = disable
    $PanelContainer/VBoxContainer/Restart.disabled = disable
    $PanelContainer/VBoxContainer/Howtoplay.disabled = disable