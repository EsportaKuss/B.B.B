extends Node
@export var ActorPath: NodePath
@export var PlaybackPath: NodePath
@export var PlaybackLPath: NodePath

@onready var playbackL = get_node(PlaybackLPath)
@onready var playback = get_node(PlaybackPath)
@onready var actor = get_node(ActorPath)

var take = false

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
		"PICK" : ["lanter_pick", -1,1,false]
		},
	L = {
		"EMPY" : ["empy",-1,1,false],
		"IDLE" :["idle",-1,1,false],
		"INTE" : ["interact",-1,1,false],
		"B_INTE" : ["interact",-1,-1,true]
	}
}
func toggle():
	if actor.lanter:
		#playback.play((PLAY.R["IDLE"])[P.NAME])
		play_action(playback,PLAY.R,"IDLE")
	else:
		play_action(playbackL,PLAY.L,"EMPY")
		#playback.play((PLAY.N["EMPY"])[P.NAME])
	
	pass

func action():
	if actor.lanter:
		if playbackL.current_animation != "interact":
			play_action(playbackL,PLAY.L,"INTE",take)
			take = !take
		else:
			return
			
	else:
		if playback.current_animation != "interact":
			play_action(playback,PLAY.R,"INTE",take)
			take = !take
		else:
			return
	#Crear algun dia una variable o un gestor de animaciones... algun dia
	pass

func _ready():
	
	
	toggle()
	pass 

func back_action():
	playback.play((PLAY.R["IDLE"])[P.NAME])

func _process(delta):
	#print(playback.current_animation)
	pass
	
func play_action (hand,hand_order,animation,rev=false,atribute = P.NAME,priority = false):
	var anima = ((hand_order[animation])[atribute])
	if rev:
		hand.play((hand_order[animation])[atribute],-1,-1,true)
		return
	if priority:
		hand.queue(anima)
	hand.play(anima)
	
