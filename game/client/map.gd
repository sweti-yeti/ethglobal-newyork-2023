extends Node2D

@export var SPEED := 640
var speed := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_game_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= speed * delta


func _on_finish_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_won.emit()


func _on_ded_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_died.emit()


func _on_game_start():
	position = Vector2.ZERO
	speed = SPEED
