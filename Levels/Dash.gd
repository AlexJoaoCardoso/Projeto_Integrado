extends Node2D

@onready var timer = $"Cooldown"
@onready var ghost_timer = $"GhostTimer"
var ghost_scene = preload("res://Player/Dash_ghost_scene.tscn")
var sprite

func start_dash(sprite, duration):
	self.sprite = sprite
	
	timer.wait_time = duration
	timer.start()
	
	ghost_timer.start()
	instance_ghost()
	
func instance_ghost():
	var ghost : Sprite2D = ghost_scene.instantiate()
	get_parent().get_parent().add_child(ghost)
	
	ghost.global_position = global_position
	ghost.texture = sprite.texture
	ghost.vframes = sprite.vframes
	ghost.hframes = sprite.hframes
	ghost.frame = sprite.frame
	ghost.flip_h = sprite.flip_h

func end_dash():
	ghost_timer.stop()

func is_dashing():
	return !timer.is_stopped()


func _on_ghost_timer_timeout():
	instance_ghost()


func _on_cooldown_timeout():
	end_dash()
