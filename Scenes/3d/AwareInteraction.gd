extends Area3D


func _on_area_entered(area):
	area.get_parent().state = "aware"
	pass # Replace with function body.


func _on_area_exited(area):
	area.get_parent().state = "un_aware"
	pass # Replace with function body.
