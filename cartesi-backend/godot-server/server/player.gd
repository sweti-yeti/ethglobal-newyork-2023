class_name Player
extends CharacterBody2D


const JUMP_VELOCITY = -1024.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Signals.player_died.connect(remove_player)
	Signals.player_won.connect(remove_player)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Signals.player_jumped.emit()

	move_and_slide()


func remove_player(_distance):
	queue_free()
