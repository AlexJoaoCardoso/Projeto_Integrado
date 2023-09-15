extends CharacterBody2D


@export var speed: float = 150.0
@export var jump_velocity: float = -300.0
@export var double_jump_velocity: float = -200.0
@export var dash_speed = 500.0
@export var dash_duration = 1.0



@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dash = $dash

<<<<<<< Updated upstream
# Get the gravity from the project settings to be synced with RigidBody nodes.
=======

>>>>>>> Stashed changes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped: bool = false
var animation_locked: bool = false
var direction: Vector2 = Vector2.ZERO



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		has_double_jumped = false
	# Handle Jump.

	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():#Normal jump
			jump()
		elif not has_double_jumped:
			#Double jump air
			velocity.y = double_jump_velocity
			has_double_jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(dash_duration)
	
	var speed = dash_speed if dash.is_dashing() else speed
	
	
	
	
	move_and_slide()
	update_animation()
	update_facing()
	


func update_animation():
	if not animation_locked:
		if direction.x != 0:
			animated_sprite.play("Run")
		else:
			animated_sprite.play("Idle")
func update_facing():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
func jump():
	velocity.y = jump_velocity
	animated_sprite.play("Jump")
	animation_locked = true





func _on_animated_sprite_2d_animation_finished():
	if(animated_sprite.animation == "Jump"):
		animation_locked = false


