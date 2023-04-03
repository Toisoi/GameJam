extends TextureButton

@onready var _menu: Menu = owner

func _on_pressed():
	_menu.sound_player.play()
	
	if _menu.selected_level < _menu.levels.size() - 1:
		_menu.selected_level += 1
		_menu.switch_level()
