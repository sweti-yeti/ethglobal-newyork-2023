extends CanvasLayer

var hud = load("res://hud.tscn")
var start_gui = load("res://start_gui.tscn")
var game_over_gui = load("res://game_over_gui.tscn")
var active_gui:Control = null


func _ready():
	Signals.player_died.connect(_on_player_died)
	Signals.player_won.connect(_on_player_won)
	Signals.start_game.connect(_on_start_game)
	load_ui(start_gui)


func load_ui(scene:PackedScene):
	var inst = scene.instantiate()
	if active_gui != null:
		remove_child(active_gui)
		active_gui.queue_free()
		active_gui = null
	active_gui = inst
	add_child(inst)


func _on_start_game():
	load_ui(hud)


func _on_player_died(_distance):
	load_ui(game_over_gui)


func _on_player_won():
	load_ui(game_over_gui)
