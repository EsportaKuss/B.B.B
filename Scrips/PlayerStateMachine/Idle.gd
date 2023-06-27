extends PlayerState
#[Get node paths]
@export var WalkPath : NodePath
@export var CrouchPath : NodePath
@export var JumpPath : NodePath


#[Node paths]
@onready var walk = get_node(WalkPath)
@onready var crouch = get_node(CrouchPath)
@onready var jump = get_node(JumpPath)



func enter_state():
	if actor.lanter and not actor.interWalking:
		ani.playback.play((ani.PLAY.R["IDLE"])[ani.P.NAME])
	elif actor.lanter and actor.interWalking:
		ani.playback.play((ani.PLAY.R["IDLE"])[ani.P.NAME],-1,1,true)
	pass

func input(event):
	if Input.get_vector("ui_left","ui_right","ui_up","ui_down"):
		return walk
	if Input.is_action_just_pressed("Jump") and actor.is_on_floor():
		return jump
	if Input.is_action_just_pressed("Crouch"):
		return crouch
	if Input.is_action_just_pressed("click"):
		if actor.lanter and not actor.looking:
			ani.playback.play((ani.PLAY.R["DROP"])[ani.P.NAME])
	
	return null
	


func _on_interaction_is_looking_lanter(old_lanter):
	pass # Replace with function body.
