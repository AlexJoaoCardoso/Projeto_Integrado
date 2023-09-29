extends Area2D

@onready var collision = $Collision as CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
