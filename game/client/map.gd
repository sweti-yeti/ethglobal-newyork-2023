extends Node2D

@export var SPEED := 640
var speed := 0
var player_is_alive = true
var player_won = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_game_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player_is_alive && !player_won:
		position.x -= speed * delta


func _on_finish_body_entered(body):
	if body is Player:
		player_won = true
		Signals.player_won.emit()


func _on_ded_body_entered(body):
	if body is Player:
		player_is_alive = false
		Signals.player_died.emit()


func _on_game_start():
	position = Vector2.ZERO
	speed = SPEED
