extends StaticBody3D
@export var turn = true
@onready var light = $OmniLight3D
# Called when the node enters the scene tree for the first time.
func _ready():
	_turn()

func _turn():
	if turn:
		light.visible = true
	else:
		light.visible = false
	pass
