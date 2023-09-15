extends Area2D

@onready var collision = $Collision as CollisionShape2D
@onready var spikes = $Spikes as Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	collision.shape.size = spikes.get_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()