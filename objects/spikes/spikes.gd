extends Area2D

func _on_body_entered(player: Player):
	player.die()
