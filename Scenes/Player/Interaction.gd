extends RayCast3D
@onready var promtp  = $promtp

signal is_looking_lanter(old_lanter)
func _ready():
	add_exception(owner)
	
func _physics_process(_delta):
	promtp.text = ""
	if is_colliding():
		var detected = get_collider()
		if  detected is Lanter:
			promtp.text = detected.name
			if Input.is_action_just_pressed("click"):
				emit_signal("is_looking_lanter",detected)
		elif detected is BunnyMan:
			#promtp.text = detected.name
			if Input.is_action_just_pressed("chat"):
				State.chatting_start(get_parent().get_parent(),detected)
		elif detected is Door:
			#print("my name is a door")
			if Input.is_action_just_pressed("chat"):
				detected.open = not detected.open
				detected._do_door()
	pass
