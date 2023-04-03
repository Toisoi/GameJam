extends Control
class_name Menu

@export var _preview_textures: ScrollContainer
@export var _level_container: HBoxContainer
@export var menu: Control
@export var settings: Control
@export var sound_player: AudioStreamPlayer
@export var fade: FadeTransition

@export var levels: Array[String]
@export var level_textures: Array[Texture]

@export var level_preview: PackedScene

@export var level_switch_time = 1.0
@export var menu_switch_time = 1.0
@export var settings_switch_time = 1.0

const _LEVEL_SWITCH = 960

var selected_level = 0

func _ready():
	fade.uncover()


func switch_level() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUART)
	tween.tween_property(_preview_textures, "scroll_horizontal", selected_level * _LEVEL_SWITCH, level_switch_time)
