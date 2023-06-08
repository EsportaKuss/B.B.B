extends Node
var has_meet_BunnyMan = 0
var chatting = false
var chatting_room = {
}
var Ui_portrait_ref

func change_portrait(actor,emotion):
	Ui_portrait_ref.texture = chatting_room[actor].myEmotions[emotion]
	pass
