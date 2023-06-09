extends PlayerState
#[Get node paths]
@export var idlePath : NodePath
@export var jumpPath : NodePath
@export var CrouchPath: NodePath

#[Node paths]
@onready var idle = get_node(idlePath)
@onready var jump = get_node(jumpPath)
@onready var crouch = get_node(CrouchPath)

func enter_state():
	if actor.lanter:
		actor.sfx_lanter.play()
		#ani.playback.play((ani.PLAY.R["WALK"])[ani.P.NAME])
		ani.play_action(ani.playback,ani.PLAY.R,"WALK",true)
	"""
	if actor.holding:
		actor.hand_R.play("Walking")
		actor.hand_L.play("Walking")
		actor.sfx_lanter.play()
	"""
func input(event):
	
	if Input.get_vector("ui_left","ui_right","ui_up","ui_down") == Vector2.ZERO:
		return idle
	if Input.is_action_just_pressed("Jump") and actor.is_on_floor():
		return jump
	if Input.is_action_just_pressed("Crouch"):
		return crouch
	pass
	
func exit_state():
	actor.velocity = Vector3.ZERO
	actor.sfx_lanter.stop()
	pass
	
func process(delta):
	move(actor,delta)

