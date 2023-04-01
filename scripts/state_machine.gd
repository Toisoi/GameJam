extends Node
class_name StateMachine

@export var _state: State

func _ready():
	await owner.ready

	for child in get_children():
		child.state_machine = self
	
	_state.enter()


func _physics_process(delta):
	_state.physics_update(delta)


func transition_to(target_state_name: NodePath, args := {}) -> void:
	if not has_node(target_state_name):
		return
	
	_state.exit()
	_state = get_node(target_state_name)
	_state.enter(args)
