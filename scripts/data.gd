extends Node

const _DATA_SAVE = "user://save.data"

var music = 1.0
var sound = 0.8
var full_screen = false

var levels_completed = 0

func _ready():
	if FileAccess.file_exists(_DATA_SAVE):
		_load()


func save() -> void:
	var file = FileAccess.open(_DATA_SAVE, FileAccess.WRITE)
	
	file.store_var(music)
	file.store_var(sound)
	file.store_var(full_screen)
	
	file.store_var(levels_completed)


func _load() -> void:
	if FileAccess.file_exists(_DATA_SAVE):
		var file = FileAccess.open(_DATA_SAVE, FileAccess.READ)
		
		music = file.get_var()
		sound = file.get_var()
		full_screen = file.get_var()
		
		levels_completed = file.get_var()
