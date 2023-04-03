extends Control

@export var _fade: FadeTransition

@export_file("*.tscn") var _menu = ""

@export var _wait_time = 2.0

func _ready():
	_fade.uncover()
	await _fade.uncover_done
	await get_tree().create_timer(_wait_time).timeout
	_fade.cover()
	await _fade.cover_done
	get_tree().change_scene_to_file(_menu)
