extends PlayerState

func enter(_args := {}):
	player.play_animation("run")
	player.move_particles.emitting = true


func exit():
	player.move_particles.emitting = false


func physics_update(_delta):
	super.physics_update(_delta)
	
	if not player.dead and player.level.lives_left > 0:
		player.apply_movement()
		
		player.flip()
		
		player.move_and_slide()
		
		if not player.is_on_floor():
			state_machine.transition_to("Fall", {"fall_jump": true})
		elif Input.is_action_just_pressed("jump"):
			state_machine.transition_to("Jump")
		elif player.get_axis() == 0:
			state_machine.transition_to("Idle")
