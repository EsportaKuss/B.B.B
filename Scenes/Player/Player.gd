class_name Player
extends CharacterBody3D

#[Player vars]
var speed = 1
@export_category("Player Stats")
@export var crouch_speed = 0.5
@export var walk_speed = 1
@export var jump_velocity = 2.5
@export var lanter: bool
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0
var looking
var target_lanter
@export_category("Mouse sensibility")
@export_range(0,0.005,0.0001) var look_sensitivity = 0.002


#[NodesPaths]
@export_category("Nodes Paths")
@export var Arm_RPath: NodePath
@export var Arm_LPath: NodePath
@export var CameraPath: NodePath
@export var LightPath: NodePath
@export var ArmCamPath: NodePath
@export var Sfx_FootStepsPath: NodePath
@export var Sfx_LanterCreakingPath: NodePath
@export var lanter_resource: PackedScene
@export var Player_State_MachinePath : NodePath
@export var AnimationPlayerLightPath: NodePath
@export var looking_Actpath: NodePath
@export var ArmAnimationsPath: NodePath

#[Nodes]
@onready var playback = get_node(ArmAnimationsPath)
@onready var arm_r = get_node(Arm_RPath)
@onready var arm_l = get_node(Arm_RPath)
@onready var camera = get_node(CameraPath)
@onready var light = get_node(LightPath)
@onready var amrCam = get_node(ArmCamPath)
@onready var sfx_footsteps = get_node(Sfx_FootStepsPath)
@onready var sfx_lanter = get_node(Sfx_LanterCreakingPath)
@onready var state_machine = get_node(Player_State_MachinePath)
@onready var ani_light_crouch = get_node(AnimationPlayerLightPath)





var moving = false
func _ready():
	speed = walk_speed
	
	
	
func _input(event):
	if event is InputEventMouseMotion and Global.chatting  == false:
		rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
func _process(_delta):
	amrCam.global_transform = camera.global_transform

	

	#_________________________________________________________
#		[Lanter funcs]
func _drop_lanter():
	if lanter :
		var my_lanter = lanter_resource.instantiate()
		get_tree().current_scene.add_child(my_lanter)
		my_lanter.global_position = position - Vector3(0,0.15,0)
		lanter = !lanter
func _pick_up_lanter():
	if not lanter:
		target_lanter.queue_free()
		lanter = !lanter
#________________________________________________________
	
#_________________________________________________________
#	[Hand interaction]

#this func only play a the interaction animation based on the lanter

#_________________________________________________________
	
func sanity(_mind):
	light.light_color(255,255,_mind)
	
	

