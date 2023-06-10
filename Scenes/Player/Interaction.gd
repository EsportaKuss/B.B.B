extends RayCast3D
@onready var promtp  = $promtp

func _ready():
	add_exception(owner)
	
func _physics_process(_delta):
	promtp.text = ""
	if is_colliding():
		var detected = get_collider()
		if  detected is Lanter:
			promtp.text = detected.name
		elif detected is BunnyMan:
			promtp.text = detected.name
			if Input.is_action_just_pressed("chat"):
				State.chatting_start(get_parent().get_parent(),detected)

	pass
