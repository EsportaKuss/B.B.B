extends RayCast3D
@export var playerPath : NodePath

@onready var promtp  = $promtp
@onready var player = get_node(playerPath)
@export var AniPath : NodePath

@onready var ani = get_node(AniPath)

var point
signal is_looking_lanter(old_lanter)
func _ready():
	add_exception(owner)
	
func _physics_process(_delta):
	promtp.text = ""
	if Input.is_action_just_pressed("click"):
		point = get_collision_point ()
	if is_colliding():
		var detected = get_collider()
		
		if  detected is Lanter:
			#promtp.text = detected.name
			player.looking = true
			if player.looking:
				ani.action()
			if Input.is_action_just_pressed("click"):
				player.looking = false
				player.target_lanter = detected
				ani.play_action(ani.playback,ani.PLAY.R,"PICK")
			


		elif detected is Door:
			player.looking = true
			ani.action()
			if Input.is_action_just_pressed("click"):
				detected.mode = not detected.mode
				detected.change_mode(detected.mode)
					
	elif player.looking:
		if player.lanter:
			ani.play_action(ani.playbackL,ani.PLAY.L,"INTE",true)
		else:
			ani.play_action(ani.playback,ani.PLAY.R,"INTE",true)
		player.looking = false
	"""				
	elif player.looking:
		if player.lanter:
			var _ani = (ani.PLAY.L["B_INTE"])
			ani.playbackL.play(_ani[ani.P.NAME],_ani[ani.P.BLE],_ani[ani.P.SP],_ani[ani.P.BACK])
			player.looking = false
			
		else:
			var _ani = (ani.PLAY.R["B_INTE"])
			ani.playback.play(_ani[ani.P.NAME],_ani[ani.P.BLE],_ani[ani.P.SP],_ani[ani.P.BACK])
			player.looking = false
	"""
	
	pass
	
func ready():
	pass
