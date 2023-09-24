extends Node

var game_tick = 0
var event_log = []
var map_data = []

enum Events {
	JUMP,
	GAME_OVER
}

func _ready():
	Signals.start_game.connect(_on_start_game)
	Signals.player_jumped.connect(_on_player_jump)
	Signals.player_died.connect(_on_end_game)
	Signals.player_won.connect(_on_end_game)


func _on_start_game():
	game_tick = 0
	event_log = []


func _on_end_game(distance: float):
	event_log.append(
		{
			frame= game_tick,
			event= "GAME_OVER"
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


func publish_game_log():
	var log = JSON.stringify({
		events = event_log,
		map = map_data
	})
	print_debug(log)
	JavaScriptBridge.eval("window.submitScore(" + log + ")")


func _physics_process(_delta):
	game_tick += 1
