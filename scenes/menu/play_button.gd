extends TextureButton

@onready var _menu: Menu = owner

func _on_pressed():
	_menu.sound_player.play()
	await _menu.sound_player.finished
	
	_menu.fade.cover()
	await _menu.fade.cover_done
	get_tree().change_scene_to_file(_menu.levels[_menu.selected_level])
