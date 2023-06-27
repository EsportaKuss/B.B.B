extends Node
@export var ActorPath: NodePath
@export var PlaybackPath: NodePath

@onready var playback = get_node(PlaybackPath)
@onready var actor = get_node(ActorPath)
var last_take = "in"

var current_act

enum P
{
	NAME,
	BLE,
	SP,
	BACK
}
	
var PLAY = {
	N = {
		"EMPY" : ["idle_no_lanter",-1,1,false]
	},
	R = {
		"IDLE" : ["idle",-1 ,1 ,false], 
		"INTE" : ["interact", -1 , 1, false],
		"B_INTE" :["interact", -1 , -1, true],
		"WALK" : ["walk", -1,1,false],
		"WALK_INTE" : ["walk_inte",-1,1,false],
		"DROP" : ["lanter_drop", -1,1,false],
		"PICK" : ["lanter_pick", -11,1,false]
		},
	L = {
		"IDLE" : ["idle_plus_l",-1,1,false],
		"INTE" : ["interact_l",-1,1,false],
		"B_INTE" : ["interact_l",-1,-1,true]
	}
}
func toggle():
	if actor.lanter:
		playback.play((PLAY.R["IDLE"])[P.NAME])
	
		
	else:
		playback.play((PLAY.N["EMPY"])[P.NAME])
	
	pass

func action():
	if last_take == "in":
		if actor.lanter:
			playback.play((PLAY.L["INTE"])[P.NAME])
			last_take = "out"
		else:
			if not playback.current_animation == (PLAY.R["INTE"])[P.NAME]:
				playback.play((PLAY.R["INTE"])[P.NAME])
				last_take = "out"
		
	
	#Crear algun dia una variable o un gestor de animaciones... algun dia
		
	pass

func _ready():
	print(actor.lanter)
	toggle()
	pass 

func back_action():
	playback.play((PLAY.R["IDLE"])[P.NAME])

func _process(delta):
	#print(playback.current_animation)
	pass
