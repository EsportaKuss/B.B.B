extends PlayerState
#[Get node paths]
@export var idlePath : NodePath
@export var WalkPath : NodePath

#[Node paths]
@onready var idle = get_node(idlePath)
@onready var walk = get_node(WalkPath)


func enter_state():
	"""
	if actor.hand_R:
		actor.body_lanter.play("stop")
		actor.body_hand.play("Idle")
	"""
	actor.ani_light_crouch.play("Crouch")
	actor.speed = actor.crouch_speed
func exit_state():
	actor.ani_light_crouch.play_backwards("Crouch")
	actor.speed = actor.walk_speed

func process(delta):
	move(actor,delta)
	if Input.is_action_just_released("Crouch"):
		return idle
	

func input(event):
	pass
