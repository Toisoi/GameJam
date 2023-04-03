extends TileMap

@export var _player_camera: Camera2D

@export var _spikes: PackedScene

enum {
	TRAPS_LAYER = 1
}

enum {
	SPIKES_ID = 1
}

func _ready():
	var cells = get_used_cells(TRAPS_LAYER)
	for cell in cells:
		match get_cell_source_id(TRAPS_LAYER, cell):
			SPIKES_ID:
				var tile_data = get_cell_tile_data(TRAPS_LAYER, cell)
				set_cell(TRAPS_LAYER, cell)
				var spikes = _spikes.instantiate()
				spikes.position = map_to_local(cell)
				if tile_data.transpose and tile_data.flip_h:
					spikes.rotation_degrees = 90
				elif tile_data.flip_v:
					spikes.rotation_degrees = 180
				elif tile_data.transpose:
					spikes.rotation_degrees = 270
				add_child(spikes)
	
	var used_rect = get_used_rect()
	_player_camera.limit_left = (map_to_local(used_rect.position).x- tile_set.tile_size.x / 2) * scale.x
	_player_camera.limit_right = (map_to_local(used_rect.end).x - tile_set.tile_size.x / 2) * scale.x
	_player_camera.limit_bottom = (map_to_local(used_rect.end).y - tile_set.tile_size.y / 2) * scale.y
