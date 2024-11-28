extends CharacterBody2D

class_name Enemy

const SPEED = 100.0

@onready var player = $"../Player"
@onready var sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

func _ready():
	pass

func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * SPEED
		move_and_slide()
