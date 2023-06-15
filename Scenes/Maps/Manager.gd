extends Node3D

@export var TrainPath: NodePath
@onready var Wagons = get_node(TrainPath).get_children()



var current_wagon

func _input(event):
	if Input.is_action_just_pressed("TEST"):
		wagon_ref_id(1).action_obj("blink",wagon_ref_id(1).Lights,wagon_ref_id(1).all_lights)
func wagon_ref_id(id):
	for wagon in Wagons:
		if wagon.id == id:
			return wagon
	return Wagons[0]
