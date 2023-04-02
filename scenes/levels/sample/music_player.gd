extends AudioStreamPlayer

const MIN_DB = 80

func _ready():
	volume_db = Data.music * MIN_DB - MIN_DB
