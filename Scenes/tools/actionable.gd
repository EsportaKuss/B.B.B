extends Area3D

const  Balloon = preload("res://dialogs/balloon.tscn") 

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func action():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource,dialogue_start)
