extends Area2D

func _on_body_entered(player: Player):
	if not player.collide_with_trap:
		player.collide_with_trap = true
		
		player.die()
