class_name Wagon
extends StaticBody3D
@export_category("Train ID")
@export var id: int
const all_lights = [0,1,2,3]
const all_door = [0,1]

@export_category("Train Properties")
"""
@export_enum("turn_on","turn_off","blink") var Mode: String = "turn_off"
@export_group("mode")
@export_enum("turn_on","turn_off","blink") var light1_mode: String 
@export_enum("turn_on","turn_off","blink") var light2_mode: String  
@export_enum("turn_on","turn_off","blink") var light3_mode: String 
@export_enum("turn_on","turn_off","blink") var light4_mode: String  
"""
@export_category("NodePath")
@export var DoorPath: NodePath
@export var LightsPath: NodePath
@export var SignPath: NodePath

@export var lights_mode = ["turn_on","turn_on","turn_on","turn_on"]



#					[back	front]
@onready var Doors = get_node(DoorPath).get_children()
#					[back								front]
@onready var Lights = get_node(LightsPath).get_children()

@onready var signs = get_node(SignPath).get_children()
# Called when the node enters the scene tree for the first time.
func _ready():
	apply_signs()
	for i in Lights.size():
		action_obj(lights_mode[i],Lights,[i])
		#print(lights_mode[i])
	
	#action_obj(Mode,Lights,all_lights)
	#for i in Lights.size():
			#action_obj(lights_mode[i],Lights,[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#open and close doors, turn on and turn of lights
func action_obj(action,_obj,ID):
	#print(id)
	for i in ID.size():
		var _mode = false
		match action:
			"turn_off": _mode = false
			"turn_on": _mode = true
			"blink": 
				_obj[ID[i]].get_node("OmniLight3D/LightsBlinks").play("blink")
			_: pass
		if action != "blink":
			#obj[ID[i]].mode = _mode
			_obj[ID[i]].change_mode(_mode)
			
func apply_signs ():
		for i in signs.size():
			#print(i)
			signs[i].get_node("number").text = "%03d" % id
