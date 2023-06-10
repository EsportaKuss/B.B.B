class_name BunnyMan
extends Node

@export var myEmotions = {}
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

const  Balloon = preload("res://dialogs/balloon.tscn") 

func action():
	var balloon: Node = Balloon.instantiate()
	State.Ui_portrait_ref = balloon.get_node("Balloon/Margin/Hbox/Portrait")
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource,dialogue_start)

