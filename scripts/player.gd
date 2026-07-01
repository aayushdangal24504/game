extends CharacterBody2D

var speed = 220.0
var run_speed = 300.0
var jump_velocity = -460.0
var gravity = 1400.0

func _physics_process(delta):
	var dir = 0.0
	if Input.is_action_pressed("move_left"):
		dir = dir - 1.0
	if Input.is_action_pressed("move_right"):
		dir = dir + 1.0
	
	var target_speed = speed
	if Input.is_action_pressed("run"):
		target_speed = run_speed
	
	velocity.x = move_toward(velocity.x, dir * target_speed, 1800.0 * delta)
	if dir == 0.0:
		velocity.x = move_toward(velocity.x, 0, 2000.0 * delta)
	
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
		if velocity.y > 900:
			velocity.y = 900
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	move_and_slide()
	
	# face direction
	if velocity.x > 10:
		$Visual.scale.x = 1
	if velocity.x < -10:
		$Visual.scale.x = -1
