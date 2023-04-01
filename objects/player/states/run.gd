extends PlayerState

func enter(_args := {}):
	player.animated_sprite.play("run")


func physics_update(_delta):
	super.physics_update(_delta)
	
	player.apply_gravity()
	player.apply_movement()
	
	player.flip()
	
	player.move_and_slide()
	
	if not player.is_on_floor():
		state_machine.transition_to("Fall", {"fall_jump": true})
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
	elif player.get_axis() == 0:
		state_machine.transition_to("Idle")