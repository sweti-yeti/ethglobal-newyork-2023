extends Node2D

var rollup_server = OS.get_environment("ROLLUP_HTTP_SERVER_URL")
# Called when the node enters the scene tree for the first time.

var finish_request = {
	status="accept"
}
func _ready():
	print("Hello from Godot on Cartesi")
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = http_request.request(
		rollup_server + "/finish",
		PackedStringArray(),
		HTTPClient.METHOD_GET,
		JSON.stringify(finish_request))

	if error != OK:
		push_error("An error occurred in the HTTP request.")


# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Error requesting rollup server")

	var response = JSON.parse_string(body)
	if response["request_type"] == "advance_state":
		handle_advance(response["data"])
	elif response["request_type"] == "inspect_state":
		handle_inspect(response["data"])


func handle_advance(data):
	print_debug(data)


func handle_inspect(data):
	print_debug(data)
