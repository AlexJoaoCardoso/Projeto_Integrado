extends CharacterBody2D

@export var normalized_speed: float = 160.0
@export var speed = 1.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var dash = $Dash

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO
var canDash = true

const dashspeed = 1000
const dashlength = .1


func _ready():
	animation_tree.active = true
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("dash") and canDash:
		dash.start_dash(sprite, dashlength)
		canDash = false
		await get_tree().create_timer(1.0).timeout
		canDash = true
	speed = dashspeed if dash.is_dashing() else normalized_speed
	
	direction = Vector2(
		Input.get_axis("left","right"),
		Input.get_axis("up", "down")
	).normalized()
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing()

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)
func update_facing():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

#
#@export var jump_velocity: float = -300.0
#@export var double_jump_velocity: float = -200.0
