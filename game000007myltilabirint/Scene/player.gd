extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@export var state_machine: PlayerStateMachine
var current_speed: float = SPEED # Переменная для текущей скорости

@onready var sprite = $AnimatedSprite2D
@onready var cShapeIdle = $csIdle
@onready var cShapeCrouch = $csCrunch

func _ready():
	state_machine = $PlayerStateMachine

func _process(delta):
	state_machine._process(delta)

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()

	state_machine._physics_process(delta)

func _unhandled_input(event):
	state_machine._unhandled_input(event)

# Переносим метод change_direction внутрь класса Player
func change_direction(dir):
	velocity.x = dir * current_speed
	if dir < 0:
		if sprite.flip_h == false:
			sprite.position.x -= 8
		sprite.flip_h = true
	elif dir > 0:
		if sprite.flip_h == true:
			sprite.position.x += 8
		sprite.flip_h = false
