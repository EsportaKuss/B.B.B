extends Control
@export var MenuPath: NodePath
@export var OptionPath: NodePath
@export var VideoPath: NodePath
@export var AudioPath: NodePath

@onready var menu = get_node(MenuPath)
@onready var option = get_node(OptionPath)
@onready var video = get_node(VideoPath)
@onready var audio = get_node(AudioPath)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
		toggle()

#__________[Funcs]____________________
func toggle():
		visible = !visible
		get_tree().paused = visible

func show_and_hide(first,second):
	first.show()
	second.hide()

func volume(bus_index,value):
	AudioServer.set_bus_volume_db(bus_index,value)
#_______________________________________



#__________[Menu]____________________
func _on_play_pressed():
	toggle()
	get_tree().change_scene_to_file("res://Scenes/Maps/Map_1.tscn")

func _on_options_pressed():
	show_and_hide(option,menu)

func _on_exit_pressed():
	get_tree().quit()
#_______________________________________



#__________[Options]_____________________
func _on_video_pressed():
	show_and_hide(video,option)
	#__________[Video]_____________________
	#	FullScreen
	#	Borderless
	#	VSync
	#_______________________________________

func _on_audio_pressed():
	show_and_hide(audio,option)
	#__________[Audio]_____________________
	#	Master
	#	Music
	#	Sound Fx
	#_______________________________________

func _on_back_from_options_pressed():
	show_and_hide(menu,option)
#________________________________________



#__________[Video]_____________________
func _on_full_screen_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_borderless_toggled(button_pressed):
	if button_pressed:
		DisplayServer.WINDOW_FLAG_BORDERLESS
	else:
		DisplayServer.WINDOW_FLAG_EXTEND_TO_TITLE


func _on_v_sync_toggled(button_pressed):
	if button_pressed:
		DisplayServer.VSYNC_ENABLED
	else:
		DisplayServer.VSYNC_DISABLED
		
func _on_back_from_video_pressed():
	show_and_hide(option,video)
#_______________________________________


#__________[Audio]_____________________
func _on_master_value_changed(value):
	volume(0, value)


func _on_music_value_changed(value):
	volume(1, value)


func _on_sound_fx_value_changed(value):
	volume(2, value)

#_______________________________________

func _on_back_from_audio_pressed():
	show_and_hide(option,audio)
