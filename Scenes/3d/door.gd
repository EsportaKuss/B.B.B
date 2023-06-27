class_name  Door
extends StaticBody3D
@export var mode = false
@export var  time_opened = 2
@export var max_distance_to = 1.5
@export var locked: bool
@onready var door = $MeshInstance3D
@onready var Collision = $CollisionShape3D
@onready var sfx = $sfx
@export var char_path: NodePath
@onready var char_node = get_node(char_path)
var was_interacted = false
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	change_mode()
	sfx.volume_db = Global.MASTER_VOLUME - 20
func change_mode():
	if mode:
		sfx.playing = true
		was_interacted = true
		door.play("Open")
	else:
		door.play("Closed")
	Collision.disabled = mode
	#mode = not mode
	
func _process(delta):
	if was_interacted:
		timer += delta
		if timer >= time_opened and char_node.global_position.distance_to(global_position) >= max_distance_to:
			mode = not mode
			change_mode()
			was_interacted = false
			timer = 0
		else:
			pass
