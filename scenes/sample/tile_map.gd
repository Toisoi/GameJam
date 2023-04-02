extends TileMap

@export var _spikes: PackedScene

const TRAPS_LAYER = 1

enum {
	SPIKES_ID = 1
}

func _ready():
	var cells = get_used_cells(TRAPS_LAYER)
	for cell in cells:
		match get_cell_source_id(TRAPS_LAYER, cell):
			SPIKES_ID:
				set_cell(TRAPS_LAYER, cell)
				var spikes = _spikes.instantiate()
				spikes.position = map_to_local(cell)
				add_child(spikes)
