extends RayCast3D
@onready var promtp  = $promtp
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
			promtp.text = detected.name
			if Input.is_action_just_pressed("click"):
				emit_signal("is_looking_lanter",detected)
		elif detected is BunnyMan:
			#promtp.text = detected.name
			if Input.is_action_just_pressed("chat"):
				Global.chatting_start(get_parent().get_parent(),detected)
		elif detected is Door:
			#print("my name is a door")
			if Input.is_action_just_pressed("chat"):
				detected.mode = not detected.mode
				detected.change_mode()
	pass
