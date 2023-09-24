extends Node

var game_tick = 0
var event_log = []
var map_data = []

enum Events {
	JUMP=1,
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
			f= game_tick,
			e= Events.GAME_OVER
		}
	)
	print_debug(event_log)


func _on_player_jump():
	event_log.append(
		{
			f= game_tick,
			e= Events.JUMP
		}
	)


func publish_game_log():

	var packed_log = PackedByteArray([0])
	packed_log.resize(event_log.size()*2)
	for i in range(0, event_log.size()):
		var event = PackedByteArray([0, 0])
		# Embed frame number in first 12 bits
		event[0] = (event_log[i].f >> 4)
		event[1] = (event_log[i].f & 31) << 4
		# Add event ID to remaining 4
		event[1] |= event_log[i].e
		print_debug(event)
		packed_log[(i)*2] = event[0]
		packed_log[(i)*2+1] = event[1]
	var log = JSON.stringify({
		distance = Globals.distance,
		events = packed_log
	})
	print_debug(packed_log)
	JavaScriptBridge.eval("window.submitScore(" + str(log) + ")")


func _physics_process(_delta):
	game_tick += 1
