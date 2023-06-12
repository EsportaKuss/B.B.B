extends CharacterBody3D
@export var speed = 1
@export var jump_velocity = 2.5
@export var myEmotions = {}
@export_range(0,0.005,0.0001) var look_sensitivity = 0.002
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0
var holding = true
var looking
@onready var Hand = $Camera3D/Hand
@onready var lanter = $Camera3D/Lanter
@onready var camera:Camera3D = $Camera3D
@onready var Light = $Camera3D/myLight
@onready var ArmCam = $Camera3D/SubViewportContainer/SubViewport/CamArm
@export var lanter_resource: PackedScene
var state_scrip = preload("res://States/states.gd")
var moving = false

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
		if not moving: lanter.play("Idle")
	if Input.is_action_just_pressed("click"):
		if holding:
			_drop_lanter()

func _process(_delta):
	ArmCam.global_transform = camera.global_transform
	if moving:
		lanter.play("Walking")
		Hand.play("Walking")
	else:
		Hand.play("Idle")
		#await get_tree().create_timer(1).timeout
		lanter.play("stop")




func _drop_lanter():
	Hand.visible = false
	lanter.visible = false
	Light.visible = false
	holding = false
	var my_lanter = lanter_resource.instantiate()
	get_tree().current_scene.add_child(my_lanter)
	my_lanter.position = position

func _pick_up_lanter(old_lanter):
	#updating the var holding to hide the arm and lanter
	Hand.visible = true
	lanter.visible = true
	Light.visible = true
	holding = true
	#destroy lanter
	print(old_lanter.name)
	old_lanter.queue_free()
	

