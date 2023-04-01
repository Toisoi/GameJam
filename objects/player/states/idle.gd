extends PlayerState

func enter(_args := {}):
	player.animated_sprite.play("idle")


func physics_update(_delta):
	super.physics_update(_delta)
	
	player.apply_gravity()
	player.move_and_slide()
	
	if player.get_axis() != 0:
		state_machine.transition_to("Run")
	
	if not player.is_on_floor():
		state_machine.transition_to("Fall", {"fall_jump": true})
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")