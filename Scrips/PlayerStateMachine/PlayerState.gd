class_name PlayerState
extends State

var ani

	
func move(actor,delta):
	var horizontal_velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized() * actor.speed * delta
	actor.velocity = horizontal_velocity.x * actor.global_transform.basis.x + horizontal_velocity.y * actor.global_transform.basis.z
	
	if actor.is_on_floor():
			actor.velocity_y = actor.jump_velocity if Input.is_action_just_pressed("ui_accept") else 0.0
	else: 
		actor.velocity_y -= actor.gravity * delta
	actor.velocity.y = actor.velocity_y
	actor.move_and_slide()
	
	


func _light_sanity():
	actor.light.light_color = Color8(Global.sanity,255,255)
