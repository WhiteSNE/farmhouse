extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED := 150.0

func _physics_process(_delta):
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED

	if input_direction != Vector2.ZERO:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
		
	if input_direction.x != 0:
		animated_sprite.flip_h = input_direction.x > 0
	move_and_slide()
