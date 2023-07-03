extends Node3D
enum layer_type {
	background = 2,
	midground = 3,
	foreground = 4
}
@onready var player = get_tree().current_scene.get_node("Char")
@onready var background = $background
@onready var midground = $midground
@onready var foreground = $foreground

@export var distance = 120


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_parallax(delta)
	

func _limits(ground,child,layer,delta):
	#print(ground.get_child(child).global_position.z)
	ground.get_child(child).global_position.z -= layer * delta*5
	if ground.get_child(child).global_position.z <= player.global_position.z - distance:
		ground.get_child(child).global_position.z = player.global_position.z + distance
	
func _parallax(delta):
	_limits(foreground,0,layer_type.foreground,delta)
	_limits(foreground,1,layer_type.foreground,delta)
	_limits(foreground,2,layer_type.foreground,delta)
	_limits(foreground,3,layer_type.foreground,delta)
	#_limits(foreground,4,layer_type.foreground,delta)
	
	_limits(midground,0,layer_type.midground,delta)
	_limits(midground,1,layer_type.midground,delta)
	_limits(midground,2,layer_type.midground,delta)
	
	_limits(background,0,layer_type.background,delta)
	_limits(background,1,layer_type.background,delta)
	_limits(background,2,layer_type.background,delta)
	

			
