extends AnimatableBody2D

@export var speed = 200
var mouse_position = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var velocity = direction * speed
	
	# Move the object directly to the target position
	global_position += velocity * delta
	# Check for mouse movement and play/stop animation
	$AnimatedSprite2D.play()
