extends Node2D

@export var SPEED := 640
var speed := 0
var output_path = "res://mapdata.json"
var map_json = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_game_start)
	generate_map_json()


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


func generate_map_json():
	var tm:TileMap = $TileMap
	var bitmap:Array[PackedByteArray] = []
	
	for i in range(20):
		bitmap.append(PackedByteArray([0]))
		bitmap[i].resize(64)
	
	for tile in tm.get_used_cells(0):
		var target_y = tile[0] / 8
		var bit = 1 << (8-(tile[0] % 8 + 1))
		bitmap[tile[1]][target_y] |= bit
	
	var hexmap = []
	for i in bitmap:
		var hex = i.hex_encode()
		hexmap.append([
			hex.substr(0, 32),
			hex.substr(32, 32),
			hex.substr(64, 32),
			hex.substr(96, 32)
		])

	print_debug(JSON.stringify(hexmap))
	map_json = JSON.stringify(hexmap)

func load_map_json():
	# TODO: read from file
	pass
