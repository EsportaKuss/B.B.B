extends StaticBody3D
@export var mode: bool = true
@onready var light = $OmniLight3D
# Called when the node enters the scene tree for the first time.
func _ready():
	#change_mode()
	pass

func change_mode(_mode):
	if _mode:
		light.light_energy = 1
	else:
		light.light_energy = 0
	pass
