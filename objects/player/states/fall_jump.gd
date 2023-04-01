extends PlayerState

func enter(_args := {}):
	player.velocity.y = -player.jump_strength
	player.move_and_slide()


func physics_update(_delta):
	super.physics_update(_delta)
	
	player.apply_gravity()
	player.apply_movement()
	
	player.flip()
	
	player.move_and_slide()
	
	if player.velocity.y > 0:
		state_machine.transition_to("Fall")