class_name Wagon
extends StaticBody3D
@export var id: int
const all_lights = [0,1,2,3]
const all_door = [0,1]
@export var DoorPath: NodePath
@export var LightsPath: NodePath
#					[back	front]
@onready var Doors = get_node(DoorPath).get_children()
#					[back								front]
@onready var Lights = get_node(LightsPath).get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#open and close doors, turn on and turn of lights
func action_obj(action,obj,id):
	for i in id.size():
		var _mode = false
		match action:
			"turn_off": _mode = false
			"turn_on": _mode = true
			"blink": 
				obj[id[i]].get_node("OmniLight3D/LightsBlinks").play("blink")
			_: pass
		if action != "blink":
			obj[id[i]].mode = _mode
			obj[id[i]].change_mode()
			
		
		
