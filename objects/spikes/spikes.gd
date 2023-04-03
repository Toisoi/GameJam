extends Area2D

@export var sprite: Sprite2D

func _on_body_entered(player: Player):
	if not player.dead:
		player.dead = true
		
		player.die()
