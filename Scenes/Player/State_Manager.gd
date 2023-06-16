class_name PlayerStateMachine
extends Node

@export var starting_state:NodePath
@export var actor_node : NodePath 
var actor
var starting_state_node

var current_state: State

func _ready():
	if actor_node!=null:
		actor=get_node(actor_node)
		if actor:
			for child in get_children():
				child.actor=actor
			starting_state_node = get_node(starting_state)
			change_state(starting_state_node)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit_state()
	current_state=new_state
	current_state.enter_state()

func _physics_process(delta):
	#print(current_state.name)
	var new_state=current_state.process(delta)
	if new_state:
		change_state(new_state)

func _unhandled_input(event):
	var new_state=current_state.input(event)
	if new_state:
		change_state(new_state)
