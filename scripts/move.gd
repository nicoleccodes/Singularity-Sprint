extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var right = "ui_right"
var left = "ui_left"
var jump = "ui_accept"
var anim_count = 1
var count = 3
var anim = Global.test

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed(jump) and is_on_floor():
		$AudioStreamPlayer2D.play()
		velocity.y = JUMP_VELOCITY
		$Sprite_jump.jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(left, right)
	var sprite = get_node("Sprite2D")
	if direction:
		velocity.x = direction * SPEED
		if count == 0:
			if anim_count < 6:
				anim_count += 1
			else:
				anim_count = 1
			sprite.texture = load("res://animations/" + str(anim) + str(anim_count) + ".PNG")
			count = 3
		count -= 1
	else:
		sprite.texture = load("res://animations/" + str(anim) + "1.PNG")
		velocity.x = move_toward(velocity.x, 0, 50)
	if position.x > 400 and velocity.x > 0:
		velocity.x = 0
	
	move_and_slide()

func freeze():
	var hold = [right, left, jump]
	right = "1"
	left = "1"
	jump = "1"
	await get_tree().create_timer(0.5).timeout
	right = hold[0]
	left = hold[1]
	jump = hold[2]
