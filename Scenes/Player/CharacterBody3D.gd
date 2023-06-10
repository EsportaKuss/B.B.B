extends CharacterBody3D
@export var speed = 1
@export var jump_velocity = 2.5
@export var myEmotions = {}
@export_range(0,0.005,0.0001) var look_sensitivity = 0.002
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0
@onready var Hand = $Camera3D/Hand
@onready var Lanter = $Camera3D/Lanter
@onready var camera:Camera3D = $Camera3D
@onready var ArmCam = $Camera3D/SubViewportContainer/SubViewport/CamArm
var state_scrip = preload("res://States/states.gd")
var moving = false
"""
func _unhandled_input(event):
	if Input.is_action_just_pressed("chat"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			State.chatting_room["emisor"] = self
			State.chatting_room["receptor"] = actionables[0].get_parent()
			actionables[0].action()
			state.chatting = true
			return
"""
func _process(__delta):
	ArmCam.global_transform = camera.global_transform
	if moving:
		Lanter.play("Walking")
		Hand.play("Walking")
	else:
		Lanter.play("stop")
		Hand.play("Idle")
	
func _physics_process(_delta):
	if State.chatting  == false:
		var horizontal_velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized() * speed * _delta
		velocity = horizontal_velocity.x * global_transform.basis.x + horizontal_velocity.y * global_transform.basis.z
		if horizontal_velocity.x != 0 or horizontal_velocity.y != 0: 
			moving = true
		else: 
			moving = false
			
		if is_on_floor():
			velocity_y = jump_velocity if Input.is_action_just_pressed("ui_accept") else 0.0
		else: 
			velocity_y -= gravity * _delta
		velocity.y = velocity_y
		move_and_slide()
		if Input.is_action_just_pressed("ui_cancel"): 
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE


func _input(event):
	if event is InputEventMouseMotion and State.chatting  == false:
		rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
		if not moving: Lanter.play("Idle")


