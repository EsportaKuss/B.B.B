extends Area3D

@export var playbackPath : NodePath
@onready var playback = get_node(playbackPath)
@export var times: int = 1
@export_enum("hide","show") var mode: String = "hide"
func _ready():
	match  mode:
		"hide": 
			get_parent().visible = true
		"show":
			get_parent().visible = false
func _on_body_entered(_body):
	match mode:
		"hide":
			if times > 0:
				playback.play("hide")
				times -= 1
		"show":
			if times > 0: playback.play("show")
			times -= 1
	pass # Replace with function body.
