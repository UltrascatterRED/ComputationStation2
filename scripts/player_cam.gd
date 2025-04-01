extends Camera2D
const MOVE_SPEED = 1000
const ZOOM_FACTOR = 2

func _process(delta):
	if Input.is_action_pressed("camera_left"):
		global_position += Vector2.LEFT * delta * MOVE_SPEED
	elif Input.is_action_pressed("camera_right"):
		global_position += Vector2.RIGHT * delta * MOVE_SPEED
	if Input.is_action_pressed("camera_forward"):
		global_position += Vector2.UP * delta * MOVE_SPEED
	elif Input.is_action_pressed("camera_back"):
		global_position += Vector2.DOWN * delta * MOVE_SPEED
	#elif Input.is_action_pressed("camera_zoom_in"):
	#	zoom *= ZOOM_FACTOR
	#elif Input.is_action_pressed("camera_zoom_out"):
	#	zoom *= 1/ZOOM_FACTOR
