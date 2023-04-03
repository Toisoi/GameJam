extends HBoxContainer

@onready var _menu: Menu = owner

func _ready():
	for i in _menu.levels.size():
		var level_preview = _menu.level_preview.instantiate()
		level_preview.texture = _menu.level_textures[i]
		add_child(level_preview)
		level_preview = get_child(get_child_count() - 1)
		move_child(level_preview, get_child_count() - 2)
