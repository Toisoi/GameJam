extends PlayerState

var _timer: SceneTreeTimer

var _fall_jump = false

func enter(args := {}):
	player.play_animation("fall")
	
	_timer = get_tree().create_timer(player.fall_jump_timer)
	_timer.timeout.connect(_timeout)
	if args.has("fall_jump"):
		_fall_jump = true
	else:
		_fall_jump = false


func exit():
	_timer.timeout.disconnect(_timeout)


func physics_update(_delta):
	super.physics_update(_delta)
	
	if not player.dead:
		player.apply_movement()
		
		player.flip()
		
		if Input.is_action_just_pressed("jump") and _fall_jump:
			state_machine.transition_to("FallJump")
		
		player.move_and_slide()
		
		if player.is_on_floor():
			state_machine.transition_to("Idle")


func _timeout():
	_fall_jump = false
