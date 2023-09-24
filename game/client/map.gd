extends Node2D

@export var SPEED := 640
var speed := 0
var map_json = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_game_start)
	generate_map_json()
	load_map_json()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= speed * delta
	Globals.distance = round(-position.x/32)


func _on_finish_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_won.emit(round(-position.x/32))


func _on_ded_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_died.emit(round(-position.x/32))


func _on_game_start():
	position = Vector2.ZERO
	speed = SPEED


func generate_map_json():
	var tm:TileMap = $TileMap
	var bitmap:Array[PackedByteArray] = []
	
	for i in range(20):
		bitmap.append(PackedByteArray([0]))
		bitmap[i].resize(32)
	
	for tile in tm.get_used_cells(0):
		var target_y = tile[0] / 8
		var bit = 1 << (8-(tile[0] % 8 + 1))
		bitmap[tile[1]][target_y] |= bit
	
	var hexmap = []
	for i in bitmap:
		var hex = i.hex_encode()
		hexmap.append([
			hex.substr(0, 32),
			hex.substr(32, 32)
		])

	map_json = hexmap


func load_map_json():
	var tm:TileMap = $TileMap
	Recorder.map_data = map_json
	var hexmap = map_json
	for r in hexmap.size():
		var row = hexmap[r]
		for c in row.size():
			var chunk = row[c]
			var dec = chunk.hex_decode()
			for i in dec.size():
				var byte = dec[i]
				for k in range(8):
					var bit = 1 << (7-k)
					if byte & bit > 0:
						var coords = Vector2i((c*16+i)*8+k, r)
						tm.set_cell(0, coords, 0, Vector2i(3,3))
