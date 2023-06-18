extends Node3D

@export var TrainPath: NodePath
@onready var Wagons = get_node(TrainPath).get_children()
@export var full_screem = true


var current_wagon
func _ready():
	_screen_resize_controller()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if Input.is_action_just_pressed("TEST"):
		wagon_ref_id(1).action_obj("blink",wagon_ref_id(1).Lights,wagon_ref_id(1).all_lights)
	if Input.is_action_just_pressed("full_screen"):
		_screen_resize_controller()
		
	if Input.is_key_pressed(KEY_DELETE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_1):
		Global.sanity -= 10
		
func wagon_ref_id(id):
	for wagon in Wagons:
		if wagon.id == id:
			return wagon
	return Wagons[0]

func _screen_resize_controller():
	if full_screem:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	full_screem = not full_screem
