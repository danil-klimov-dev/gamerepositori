extends State

class_name CrouchState

const CROUCH_SPEED_MULTIPLIER = 0.5 # Множитель для замедления

func enter():
	player.sprite.play("Crouch")
	player.cShapeIdle.disabled = true
	player.cShapeCrouch.disabled = false
	player.current_speed *= CROUCH_SPEED_MULTIPLIER # Применение замедления

func exit():
	player.current_speed = player.SPEED # Восстановление скорости
	player.cShapeIdle.disabled = false
	player.cShapeCrouch.disabled = true

func process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.change_direction(direction)
	
	if Input.is_action_just_pressed("jump"):
		return state_machine.jump_state
	if not Input.is_action_pressed("move_crouch"):
		return state_machine.idle_state
	return self
