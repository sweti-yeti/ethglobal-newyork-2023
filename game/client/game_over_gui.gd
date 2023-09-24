extends CenterContainer


func _on_restart_pressed():
	print_debug("Restarting game")
	Signals.start_game.emit()


func _on_submit_pressed():
	Recorder.publish_game_log()
