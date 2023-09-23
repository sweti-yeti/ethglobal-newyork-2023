extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_restart_pressed():
	print_debug("Restarting game")
	Signals.start_game.emit()
