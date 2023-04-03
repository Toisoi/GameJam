extends Area2D

func _on_body_entered(player: Player):
	if not player.dead:
		player.dead = true
		
		player.die()
