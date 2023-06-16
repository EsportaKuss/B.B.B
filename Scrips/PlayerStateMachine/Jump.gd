extends PlayerState

#[Get node paths]
@export var idlePath : NodePath
@export var WalkPath : NodePath
#[Node paths]
@onready var idle = get_node(idlePath)
@onready var walk = get_node(WalkPath)

func process(delta):
	move(actor,delta)
	if actor.is_on_floor():
		if Input.get_vector("ui_left","ui_right","ui_up","ui_down"):
			return walk
		else: return idle
