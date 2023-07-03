extends Area3D
@export_enum("door","light") var OBJ = "light"
@export_enum("turn_on","turn_off","blink") var action : String = "turn_off"
@export var ID: Array
@export var times: int = 1

@export var Wagon : NodePath
@onready var wagon = get_node(Wagon)


func _on_body_entered(_body):
	match  OBJ:
		"door":
			if times > 0 :
				print(times)
				var i = ID[0]
				wagon.Doors[i].locks = 0
				wagon.action_obj(action,wagon.Doors,ID)
				times -= 1
		"light":
			if times > 0 :
				print(times)
				wagon.action_obj(action,wagon.Lights,ID)
				times -= 1
	
	
	
