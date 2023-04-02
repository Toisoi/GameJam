extends Area2D

@export var _animated_sprite: AnimatedSprite2D
@export var _sound_player: AudioStreamPlayer2D

@export_enum("apple", "bananas", "cherries", 
"kiwi", "melon", "orange", "pineapple", "strawberry") var _type = "apple"

func _ready():
	_animated_sprite.play(_type)


func _on_body_entered(player: Player):
	player.level.fruits_left -= 1
	_sound_player.play()
	if player.level.fruits_left == 0:
		player.level.win()
	await _sound_player.finished
	queue_free()
