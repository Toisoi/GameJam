extends AudioStreamPlayer

const DB_MIN = 80

func _ready():
	volume_db = Data.sound * DB_MIN - DB_MIN
