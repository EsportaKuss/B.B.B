class_name Player
extends CharacterBody3D

#[Player vars]
@export var speed = 1
@export var jump_velocity = 2.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0
var holding = true
var looking
@export var myEmotions = {}
@export_range(0,0.005,0.0001) var look_sensitivity = 0.002


#[NodesPaths]
@export var Body_HandPath: NodePath
@export var Body_LanterPath: NodePath
@export var CameraPath: NodePath
@export var LightPath: NodePath
@export var ArmCamPath: NodePath
@export var Sfx_FootStepsPath: NodePath
@export var Sfx_LanterCreakingPath: NodePath
@export var lanter_resource: PackedScene
@export var Player_State_MachinePath : NodePath
@export var AnimationPlayerLightPath: NodePath
#[Nodes]
@onready var body_hand = get_node(Body_HandPath)
@onready var body_lanter = get_node(Body_LanterPath)
@onready var camera = get_node(CameraPath)
@onready var light = get_node(LightPath)
@onready var amrCam = get_node(ArmCamPath)
@onready var sfx_footsteps = get_node(Sfx_FootStepsPath)
@onready var sfx_lanter = get_node(Sfx_LanterCreakingPath)
@onready var state_machine = get_node(Player_State_MachinePath)
@onready var ani_light_crouch = get_node(AnimationPlayerLightPath)


var moving = false

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
	body_hand.visible = false
	body_lanter.visible = false
	light.visible = false
	holding = false
	var my_lanter = lanter_resource.instantiate()
	get_tree().current_scene.add_child(my_lanter)
	my_lanter.position = position

func _pick_up_lanter(old_lanter):
	#updating the var holding to hide the arm and lanter
	body_hand.visible = true
	body_lanter.visible = true
	light.visible = true
	holding = true
	#destroy lanter
	#print(old_lanter.name)
	old_lanter.queue_free()
#________________________________________________________
	
