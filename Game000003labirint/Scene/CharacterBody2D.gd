extends CharacterBody2D


const speed = 300.0
@onready var sprite_2d_2 = $AnimatedSprite2D

func _physics_process(delta):
	
	velocity = Vector2.ZERO
	
	sprite_2d_2.play("Idle")
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		sprite_2d_2.flip_h = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		sprite_2d_2.flip_h = false
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	# start animation and normalization walk 
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
	if velocity == Vector2(0,0):
		sprite_2d_2.stop()
		
	position += velocity * delta
		
	move_and_slide()
	


