extends Node3D
@export var promtpPath : NodePath

@onready var promtp = get_node(promtpPath)

var order
func _ready():
	promtp.text = str(order)
