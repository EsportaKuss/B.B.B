extends StaticBody3D
@export var mode = true
@onready var light = $OmniLight3D
# Called when the node enters the scene tree for the first time.
func _ready():
	change_mode()

func change_mode():
	if mode:
		light.visible = true
	else:
		light.visible = false
	pass
