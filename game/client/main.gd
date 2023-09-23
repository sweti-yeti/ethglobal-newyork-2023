extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_start_game)


func _on_start_game():
	var player = load("res://player.tscn").instantiate()
	add_child(player)
	player.position = $SpawnPoint.global_position
