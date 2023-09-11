extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu_bnt.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/start_menu.tscn")
