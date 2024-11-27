extends State

class_name IdleState

func enter():
	player.velocity = Vector2.ZERO
	player.sprite.play("Idle")

func process(delta):
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		return state_machine.run_state
	if Input.is_action_pressed("move_crouch"):
		return state_machine.crouch_state
	if Input.is_action_just_pressed("jump"):
		return state_machine.jump_state
	return self
