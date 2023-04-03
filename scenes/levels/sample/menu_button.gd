extends TextureButton

@onready var _level: Level = owner

func _on_pressed():
	_level.play_sound(_level.button_sound)
	await _level.sound_player.finished
	_level.fade.cover()
	await  _level.fade.cover_done
	get_tree().change_scene_to_file(_level.menu)
