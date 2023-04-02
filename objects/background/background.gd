extends Sprite2D

@export var _backgrounds: Array[Texture]

@export var _move_speed = 150

var _window_height: int

func _ready():
	texture = _backgrounds.pick_random()
	
	_window_height = get_viewport().size.y


func _process(delta: float):
	region_rect.position.y += -_move_speed * delta
	if region_rect.position.y >= _window_height:
		region_rect.position.y = texture.get_size().y
