extends AnimatedSprite3D

enum tree_type {
	type1,
	type2,
	type3,
	type1_handle,
	type2_handle,
	type3_handle 
}
@export var type: tree_type

# Called when the node enters the scene tree for the first time.
func _ready():
	frame = type
	pass # Replace with function body.
