extends Node

var game_tick = 0
var event_log = []
func _ready():
	Signals.start_game.connect(_on_start_game)
	Signals.player_jumped.connect(_on_player_jump)
	Signals.game_over.connect(_on_end_game)


func _on_start_game():
	game_tick = 0
	event_log = []


func _on_end_game(distance: float):
	event_log.append(
		{
			frame= game_tick,
			distance=distance,
			event= "END_GAME"
		}
	)
	print_debug(event_log)


func _on_player_jump():
	event_log.append(
		{
			frame= game_tick,
			event= "JUMP"
		}
	)


func _physics_process(_delta):
	game_tick += 1
