extends Node2D
class_name Level

@export var audio_player: AudioStreamPlayer

@export var button_sound: AudioStreamWAV
@export var checkpoint_sound: AudioStreamWAV

func play_sound(sound: AudioStreamWAV) -> void:
	audio_player.stream = sound
	audio_player.play()


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		var image = get_viewport().get_texture().get_image()
		image.save_png("D://screenshot.png")
