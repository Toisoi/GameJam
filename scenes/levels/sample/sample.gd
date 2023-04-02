extends Node2D
class_name Level

@export var sound_player: AudioStreamPlayer
@export var _lives_label: Label
@export var _fruits_label: Label
@export var _loose_label: Label
@export var _win_label: Label
@export var _fade: FadeTransition

@export var button_sound: AudioStreamWAV
@export var checkpoint_sound: AudioStreamWAV

const _LIVES_LABEL_TEXT = "lives left: %d"
const _FRUITS_LABEL_TEXT = "fruits left: %d"

@export var _loose_texts: Array[String]
@export var _win_texts: Array[String]
@export var _loose_time = 2.0
@export var _win_time = 2.0

@export_file("*.tscn") var _next_level = ""
@export var lives_left = 5:
	set(value):
		lives_left = value
		if _lives_label != null:
			_lives_label.text = _LIVES_LABEL_TEXT % lives_left
		
		if lives_left == 0:
			_loose_label.text = _loose_texts.pick_random()
			_loose_label.show()
			await get_tree().create_timer(_loose_time).timeout
			_fade.cover()

@export var fruits_left = 5:
	set(value):
		fruits_left = value
		if fruits_left != null:
			_fruits_label.text = _FRUITS_LABEL_TEXT % fruits_left

func _ready():
	lives_left = lives_left
	fruits_left = fruits_left
	
	_fade.uncover()


func play_sound(sound: AudioStreamWAV) -> void:
	sound_player.stream = sound
	sound_player.play()


#func _process(_delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		var image = get_viewport().get_texture().get_image()
#		image.save_png("D://screenshot.png")


func win() -> void:
	_win_label.text = _win_texts.pick_random()
	_win_label.show()
	
	await get_tree().create_timer(_win_time).timeout
	
	_fade.cover()
	await _fade.cover_done
	
	get_tree().change_scene_to_file(_next_level)
