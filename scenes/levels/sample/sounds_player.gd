extends AudioStreamPlayer

const MIN_DB = 80

func _ready():
	volume_db = Data.sound * MIN_DB - MIN_DB
