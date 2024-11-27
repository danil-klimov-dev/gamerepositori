extends Node

class_name PlayerStateMachine

@export var run_state: RunState
@export var idle_state: IdleState
@export var crouch_state: CrouchState
@export var jump_state: JumpState

var current_state: State

func _ready() -> void:
	for state in [run_state, idle_state, crouch_state, jump_state]:
		if state:
			state.player = get_parent() as Player
			state.state_machine = self
	current_state = idle_state
	change_state(current_state)

func _process(delta: float) -> void:
	change_state(current_state.process(delta))

func _physics_process(delta):
	change_state(current_state.physics(delta))

func _unhandled_input(event):
	change_state(current_state.handle_input(event))

func change_state(new_state: State):
	if new_state == null or new_state == current_state:
		return
	current_state.exit()
	current_state = new_state
	current_state.enter()
