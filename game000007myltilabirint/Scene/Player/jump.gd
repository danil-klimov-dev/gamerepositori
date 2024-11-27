extends State

class_name JumpState

func enter():
	player.velocity.y = player.JUMP_VELOCITY
	player.sprite.play("Jump")

func process(delta):
	return self

func physics(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.change_direction(direction)
	
	if player.is_on_floor():
		return state_machine.idle_state
	return self

func handle_input(event):
	if Input.is_action_just_pressed("move_crouch"):
		return state_machine.crouch_state
	return self
