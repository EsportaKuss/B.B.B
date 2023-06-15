class_name Wagon
extends StaticBody3D
@export var wagon_number: int
var blink_time
const all_lights = [0,1,2,3]
const all_door = [0,1]
#					[back	front]
@onready var Doors = [$Door, $Door2]
#					[back								front]
@onready var Lights = [$Ceeling,$Ceeling2, $Ceeling3, $Ceeling4]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_0):
		action_obj("turn_on",Lights,all_lights)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#open and close doors, turn on and turn of lights
func action_obj(action,obj,id):
	for i in id.size():
		var _mode = false
		if action == "turn_off": _mode = false
		elif action == "turn_on": _mode = true
		elif action == "blink": _mode = blink_time
		else: pass
		obj[id[i]].mode = _mode
		obj[id[i]].change_mode()
		#print("obj [" + str(id[i]) + "] do something")
		blink_time = not blink_time
		
