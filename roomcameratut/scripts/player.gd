extends CharacterBody2D


const SPEED = 45


func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"): velocity.x = SPEED
	if Input.is_action_pressed("ui_left"): velocity.x = -SPEED
	if Input.is_action_pressed("ui_up"): velocity.y = -SPEED
	if Input.is_action_pressed("ui_down"): velocity.y = SPEED

	move_and_slide()
