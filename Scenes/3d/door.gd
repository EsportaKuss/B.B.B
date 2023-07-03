class_name  Door
extends StaticBody3D
@export var mode = false
@export var  time_opened = 2
@export var max_distance_to = 1.5
@export var locked: bool
@export var locks: int = 1
@onready var sfx = $sfx
@onready var sfx2 = $sfx2
@onready var playback = $AnimationPlayer
@export var char_path: NodePath
@onready var char_node = get_node(char_path)
var was_interacted = false

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	change_mode(mode)
	sfx.volume_db = Global.MASTER_VOLUME - 20
	
func change_mode(_mode):
	if locks == 0:
		if _mode:
			sfx.playing = true
			was_interacted = true
			playback.play("action")
		else:
			playback.play("action",-1,-1,true)
			sfx.playing = true
		#mode = not mode
	else:
		playback.play("lock")
		sfx2.playing = true
		locks -= 1
	
func _process(delta):
	if was_interacted:
		timer += delta
		if timer >= time_opened and char_node.global_position.distance_to(global_position) >= max_distance_to:
			mode = not mode
			change_mode(mode)
			was_interacted = false
			timer = 0
		else:
			pass
