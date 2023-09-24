extends Node2D

var rollup_server = OS.get_environment("ROLLUP_HTTP_SERVER_URL")
var leaderboard_contract = "0x7773a4B9C0B86AF9314a8C923930Ab238945f7a6"
var submitScoreSelector = "0x56117f74"
var submitScoreSelectorRaw = "submitScore(uint64,uint64,bytes calldata)"
# Called when the node enters the scene tree for the first time.

var finish_request_args = {
	url = rollup_server + "/finish",
	custom_headers = PackedStringArray(["content-type: application/json"]),
	method = HTTPClient.METHOD_POST,
	request_data = JSON.stringify({
		status = "accept"
	})
}

var submitted_args
var submitted_distance = -1

func _ready():
	print("Hello from Godot on Cartesi")
	Signals.start_game.connect(_on_start_game)
	Signals.player_died.connect(publish_gameplay_result)
	Signals.player_won.connect(publish_gameplay_result)
	query_state()
	#simulate_gameplay(event_log, distance, time)


func _on_start_game():
	var player = load("res://player.tscn").instantiate()
	add_child(player)
	player.position = $SpawnPoint.global_position


func query_state():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	print(finish_request_args)
	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = http_request.request(
		finish_request_args.url,
		finish_request_args.custom_headers,
		finish_request_args.method,
		finish_request_args.request_data
	)

	if error != OK:
		push_error("An error occurred in the HTTP request.")


# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body:PackedByteArray):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Error requesting rollup server")
	
	if response_code == 202 || body.is_empty():
		print("No pending rollup request, trying again")
		query_state()
	else:
		var response_raw = body.get_string_from_utf8()
		print("Parsing JSON response: ", response_raw)
		var response = JSON.parse_string(response_raw)
		if response["request_type"] == "advance_state":
			handle_advance(response["data"])
		elif response["request_type"] == "inspect_state":
			handle_inspect(response["data"])


func _cartesi_advance_completed(result, response_code, headers, body:PackedByteArray):
	print("Result: ", result)
	print("Body: ", body)
	query_state()


func _cartesi_inspect_completed(result, response_code, headers, body:PackedByteArray):
	print("Result: ", result)
	print("Body: ", body)
	query_state()


func handle_advance(data):
	print("Payload: ", data["payload"])

	var payload:PackedByteArray = data["payload"].substr(2).hex_decode()
	var distance = (payload[0] << 8) + (payload[1])
	payload.remove_at(0)
	payload.remove_at(0)

	var time = (payload[0] << 8) + (payload[1])
	payload.remove_at(0)
	payload.remove_at(0)

	simulate_gameplay(payload, distance, time)


func publish_gameplay_result(dist):
	print("Gameplay complete, reached ", dist)
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._cartesi_advance_completed)
	
	if dist == submitted_args.distance:
		var payload = "Game verified"
		print(payload)
		var cast_output = []
		var exit_code = OS.execute(
			"python3",
			PackedStringArray([ "cast.py", 
			str(submitted_args.time), str(submitted_args.distance), "0x" + str(submitted_args.event_log.hex_encode())]),
			cast_output,
			true
		)
		print_debug("Exit code: ", exit_code)
		print_debug("Cast output: ", cast_output)
		var args = {
			#url = rollup_server + "/voucher",
			url = rollup_server + "/notice",
			header = finish_request_args.custom_headers,
			method = finish_request_args.method,
			request_data = JSON.stringify({
				#destination = leaderboard_contract,
				payload = cast_output
			})
		}
		print("Sending voucher: ", args)
		var error = http_request.request(
			args.url,
			args.header,
			args.method,
			args.request_data
		)
	else:
		var payload = "Gameplay invalid"
		print(payload)
		var args = {
			url = rollup_server + "/notice",
			header = finish_request_args.custom_headers,
			method = finish_request_args.method,
			request_data = JSON.stringify({
				payload = "0x" + payload.to_utf8_buffer().hex_encode()
			})
		}
		print("Sending notice: ", args)
		var error = http_request.request(
			args.url,
			args.header,
			args.method,
			args.request_data
		)

func handle_inspect(data):
	print_debug(data)
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._cartesi_inspect_completed)

	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = http_request.request(
		rollup_server + "/inspect",
		finish_request_args.custom_headers,
		finish_request_args.method,
		JSON.stringify({
			payload = data["payload"]
		})
	)

func simulate_gameplay(event_log: PackedByteArray, distance: int, time: int) -> void:
	submitted_args = {
		distance= distance,
		time= time,
		event_log = event_log
	}
	# Pass event list to simulator
	var event_queue = []
	for i in event_log.size()/2:
		var event_id = event_log[(i*2)+1] & 31
		var frame = event_log[i*2] << 4
		frame |= event_log[(i*2)+1] >> 4
		event_queue.append({
			f=frame,
			e=event_id
		})
	
	print("Expected distance: ", submitted_args.distance)
	print("Expected time: ", time)
	print("Simulating event log: ", event_queue)
	$Simulator.event_queue = event_queue
	# Send start signal to spawn player
	Signals.start_game.emit()
	# Re-record events & validate against distance/time
