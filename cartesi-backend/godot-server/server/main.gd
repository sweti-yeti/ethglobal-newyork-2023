extends Node2D

var rollup_server = OS.get_environment("ROLLUP_HTTP_SERVER_URL")
var leaderboard_contract = "0xdeadbeef"
# Called when the node enters the scene tree for the first time.

var finish_request_args = {
	url = rollup_server + "/finish",
	custom_headers = PackedStringArray(["content-type: application/json"]),
	method = HTTPClient.METHOD_POST,
	request_data = JSON.stringify({
		status = "accept"
	})
}


func _ready():
	print("Hello from Godot on Cartesi")
	Signals.start_game.connect(_on_start_game)
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
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._cartesi_advance_completed)
	
	# If the score validation fails, add a notice
	# Else, add a voucher
	var args = {
		url = rollup_server + "/voucher",
		header = finish_request_args.custom_headers,
		method = finish_request_args.method,
		request_data = JSON.stringify({
			destination = leaderboard_contract,
			payload = data["payload"]
		})
	}
	print("Sending voucher: ", args)
	
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
	print("Simulating event log: ", event_queue)
	$Simulator.event_queue = event_queue
	# Send start signal to spawn player
	Signals.start_game.emit()
	# Re-record events & validate against distance/time
