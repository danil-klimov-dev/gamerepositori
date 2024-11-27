extends State

class_name RunState

func enter():
	player.sprite.play("Run")

func process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.change_direction(direction)
	
	if direction == 0:
		return state_machine.idle_state
	if Input.is_action_pressed("move_crouch"):
		return state_machine.crouch_state
	if Input.is_action_just_pressed("jump"):
		return state_machine.jump_state
	return self
