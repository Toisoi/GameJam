extends PlayerState

func enter(_args := {}):
	player.play_animation("jump")
	player.jump_particles.emitting = true
	player.play_sound(player.jump_sound)
	
	player.velocity.y = -player.jump_strength
	player.move_and_slide()


func physics_update(_delta):
	super.physics_update(_delta)
	
	if not player.dead and player.level.lives_left > 0:
		player.apply_movement()
		
		player.flip()
		
		player.move_and_slide()
		
		if player.velocity.y > 0:
			state_machine.transition_to("Fall", {"fall_jump": true})
		elif Input.is_action_just_pressed("jump"):
			state_machine.transition_to("DoubleJump")
