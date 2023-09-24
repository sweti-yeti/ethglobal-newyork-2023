extends Node2D

var event_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_start_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if event_queue.size() > 0 && Recorder.game_tick == event_queue[0].f:
		if event_queue[0].e != Recorder.Events.GAME_OVER:
			Input.action_press("ui_accept")
			Input.action_release("ui_accept")
		event_queue.pop_front()

func _on_start_game():
	pass
