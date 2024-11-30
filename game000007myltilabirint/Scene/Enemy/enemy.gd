extends CharacterBody2D

class_name Enemy

const SPEED = 190.0
const JUMP_VELOCITY = -350.0

@onready var player = $"../Player"
@onready var sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

func _ready():
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * delta  # Применяем гравитацию
	
	if player:
		var direction = (player.position - position).normalized()
		velocity.x = direction.x * SPEED
		
		# Проверка условий для прыжка
		if should_jump():
			velocity.y = JUMP_VELOCITY  # Применяем вертикальное ускорение для прыжка

	move_and_slide()

# Функция для определения необходимости прыжка
func should_jump():
	if is_on_floor():
		var space_in_front = Vector2.ZERO
		if velocity.x > 0:  # Движение вправо
			space_in_front = Vector2(10, 0)
		elif velocity.x < 0:  # Движение влево
			space_in_front = Vector2(-10, 0)
		
		var query = PhysicsRayQueryParameters2D.new()
		query.from = global_position
		query.to = global_position + space_in_front
		var collision_in_front = get_world_2d().direct_space_state.intersect_ray(query)
		
		# Добавляем проверку высоты игрока относительно врага
		if collision_in_front and (player.global_position.y < global_position.y - 10 or player.global_position.y > global_position.y + 10):
			return true
	
	return false  # Проверка наличия препятствия, нахождения на земле и позиции игрока
