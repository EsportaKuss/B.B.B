extends Area3D
@export var charpath: NodePath

@onready var char = get_node(charpath)
func _process(delta):
	if char != null:
		position.z = char.position.z +10
		
	pass
