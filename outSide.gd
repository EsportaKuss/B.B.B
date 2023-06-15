extends Area3D


func _on_body_entered(body):
	State.in_out = "out"
	BgMusic.volume_db = -25
	print("in")
	pass # Replace with function body.


func _on_body_exited(body):
	State.in_out  = "in"
	print("out")
	BgMusic.volume_db = -28

	pass # Replace with function body.
