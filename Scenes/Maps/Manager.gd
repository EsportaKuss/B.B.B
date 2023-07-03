extends Node3D

@export var TrainPath: NodePath
@onready var Wagons = get_node(TrainPath).get_children()
@export var full_screem = true
@export var MenuPath : NodePath
@onready var actor = $Char

@onready var menu = get_node(MenuPath) 

var current_wagon
func _ready():
	#menu.Menu_mode("main")
	_screen_resize_controller()
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	#menu.visible = true
func _input(event):
	if Input.is_action_just_pressed("full_screen"):
		_screen_resize_controller()
		
	
	if Input.is_key_pressed(KEY_DELETE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_1):
		Global.sanity -= 10
		actor.sanity(Global.sanity)
		
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
