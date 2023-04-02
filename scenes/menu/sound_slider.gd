extends HSlider

@onready var _menu: Menu = owner

const MIN_DB = 80

func _ready():
	value = Data.sound


func _on_value_changed(new_value):
	Data.sound = new_value
	Data.save()
	
	_menu.sound_player.volume_db = Data.sound * MIN_DB - MIN_DB
