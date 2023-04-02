extends TextureButton

@onready var _level: Level = owner

func _on_pressed():
	_level.play_sound(_level.button_sound)
	await _level.audio_player.finished
	
	get_tree().reload_current_scene()
