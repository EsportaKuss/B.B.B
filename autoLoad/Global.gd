extends Node
var has_meet_BunnyMan = 0
var chatting = false
var sanity = 255
var in_out = "in"
var MASTER_VOLUME = -20
var chatting_room = {
}
var Ui_portrait_ref
func _ready():
	BgMusic.volume_db = MASTER_VOLUME
	pass
