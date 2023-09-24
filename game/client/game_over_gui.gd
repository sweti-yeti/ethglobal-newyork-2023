extends CenterContainer

func _ready():
	$VBoxContainer/Label.text = str(Globals.distance)

func _on_restart_pressed():
	print_debug("Restarting game")
	Signals.start_game.emit()


func _on_submit_pressed():
	Recorder.publish_game_log()
	$VBoxContainer/HBoxContainer/Submit.disabled = true
