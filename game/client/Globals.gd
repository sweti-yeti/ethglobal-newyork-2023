extends Node

var distance:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_start_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_start_game():
	distance = 0
