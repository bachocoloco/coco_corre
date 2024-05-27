extends CharacterBody2D

const SPEED = 500
const JUMP_VELOCITY = -1000

const GRAVITY =2500

var speed_scale = 1

func _physics_process(delta):
	if Ghud.is_playing == true:
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$CollisionShape2D. disabled = true
				$AnimatedSprite2D.play("crouch")
			else:
				$CollisionShape2D.disabled = false
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$audiojump.play()
			velocity.y = JUMP_VELOCITY
		velocity.x = SPEED + Ghud.score
		if Ghud.score > 150:
			speed_scale = Ghud.score/150
			$AnimatedSprite2D.speed_scale = speed_scale
		velocity.y += GRAVITY * delta
		$CrouchCollisionShape2D2. disabled = !$CollisionShape2D. disabled
		move_and_slide()
		
