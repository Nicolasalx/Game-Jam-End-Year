extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_crouching = false
var crounch_reset = false
var player_pos_y = 0
var is_white = false

@onready var colorRect = $ColorRect

func _ready():
	player_pos_y = $ColorRect.position.y

func _physics_process(delta):
	if Input.is_action_just_pressed("toggle_box"):
		if !is_white:
			colorRect.color.r = 1
			colorRect.color.g = 1
			colorRect.color.b = 1
			is_white = true
		else:
			colorRect.color.r = 0
			colorRect.color.g = 0
			colorRect.color.b = 0
			is_white = false

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer.play()

	is_crouching = Input.is_action_pressed("crouch")
	if is_crouching && !crounch_reset:
		$CollisionShape2D.shape.size.y /= 2
		$ColorRect.size.y /= 2
		$ColorRect.position.y = player_pos_y - (player_pos_y / 2)
		crounch_reset = true
	elif !is_crouching && crounch_reset:
		$CollisionShape2D.shape.size.y *= 2
		$ColorRect.size.y *= 2
		$ColorRect.position.y = player_pos_y
		crounch_reset = false

	var direction = Input.get_axis("go_left", "go_right")
	var current_speed = SPEED
	
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)

	if Global.alive == false:
		position.x = 1700
		position.y = 800
		Global.alive = true
	
	move_and_slide()
