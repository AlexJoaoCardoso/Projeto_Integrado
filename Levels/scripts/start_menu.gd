extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Controles/start_btn.grab_focus()


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/level.tscn")


func _on_control_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/crontroles_cena.tscn")


func _on_quit_bnt_pressed():
	get_tree().quit()
	
