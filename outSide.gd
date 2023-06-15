extends Area3D


func _on_body_entered(body):
	#print(body.name + " is in")
	if body is Player:
		State.in_out  = "in"
		BgMusic.volume_db = -28
		get_tree().current_scene.current_wagon = get_parent()
		pass # Replace with function body.


func _on_body_exited(body):
	#print(body.name + " is out")
	if body is Player:
		State.in_out = "out"
		BgMusic.volume_db = -25
		pass # Replace with function body.
