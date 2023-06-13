extends StaticBody3D
@export var open = false
@onready var door = $MeshInstance3D
@onready var Collision = $CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	_do_door()

func _do_door ():
	if open:
		door.play("Open")
	else:
		door.play("Closed")
	Collision.disabled = open
	open = not open
	
	
