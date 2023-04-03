extends TextureButton

@onready var _menu: Menu = owner

func _on_pressed():
	_menu.sound_player.play()
	
	var screen_width = get_viewport().size.x
	
	var tween = create_tween().set_parallel()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(_menu.menu, "position:x", 0, _menu.menu_switch_time)
	tween.tween_property(_menu.settings, "position:x", screen_width, _menu.settings_switch_time)
