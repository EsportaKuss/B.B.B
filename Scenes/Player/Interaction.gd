extends RayCast3D
@onready var promtp  = $promtp

func _ready():
	add_exception(owner)
	
func _physics_process(_delta):
	promtp.text = ""
	if is_colliding():
		var detected = get_collider()
		promtp.text = detected.name
		if  detected is Lanter:
			promtp.text = detected.name
		elif detected is BunnyMan:
			if not State.chatting and Input.is_action_just_pressed("chat"):
				promtp.text = detected.name
				State.chatting_room["emisor"] = get_parent().get_parent()
				State.chatting_room["receptor"] = detected
				detected.action()
				State.chatting = true

			
	pass
