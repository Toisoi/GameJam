extends Control

@export var _preview_textures: ScrollContainer
@export var _menu: Control
@export var _level_container: HBoxContainer
@export var _settings: Control

@export var _levels: Array[String]
@export var _level_textures: Array[Texture]

@export var _level_preview: PackedScene

@export var _level_switch_time = 1.0
@export var _settings_switch_time = 1.0

const _LEVEL_SWITCH = 960

var _selected_level = 0

func _ready():
	for i in _levels.size():
		var level_preview = _level_preview.instantiate()
		level_preview.texture = _level_textures[i]
		_level_container.add_child(level_preview)
		level_preview = _level_container.get_child(_level_container.get_child_count() - 1)
		_level_container.move_child(level_preview, _level_container.get_child_count() - 2)


func _on_previous_button_pressed():
	if _selected_level > 0:
		_selected_level -= 1
		_switch_level()
	print(_selected_level)


func _on_next_button_pressed():
	if _selected_level < _levels.size() - 1:
		_selected_level += 1
		_switch_level()
	print(_selected_level)


func _on_play_button_pressed():
	get_tree().change_scene_to_file(_levels[_selected_level])



func _on_settings_button_pressed():
	var screen_width = get_viewport().size.x
	
	var tween = create_tween().set_parallel()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(_menu, "position:x", -screen_width, 1)
	tween.tween_property(_settings, "position:x", 0, _settings_switch_time)


func _on_back_button_pressed():
	var screen_width = get_viewport().size.x
	
	var tween = create_tween().set_parallel()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(_menu, "position:x", 0, 1)
	tween.tween_property(_settings, "position:x", screen_width, _settings_switch_time)


func _switch_level() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUART)
	tween.tween_property(_preview_textures, "scroll_horizontal", _selected_level * _LEVEL_SWITCH, _level_switch_time)
