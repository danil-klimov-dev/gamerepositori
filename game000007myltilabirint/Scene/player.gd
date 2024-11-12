extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -360.0


@onready var sprite_2d_2 = $AnimatedSprite2D

func ready():
	sprite_2d_2.play("Idle")

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if (direction == -1):
		sprite_2d_2.play("Run")
		sprite_2d_2.flip_h = true
	elif (direction == 1):
		sprite_2d_2.play("Run")
		sprite_2d_2.flip_h = false
	else:
		sprite_2d_2.play("Idle")
	

	move_and_slide()
