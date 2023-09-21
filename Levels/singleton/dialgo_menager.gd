extends Node

@onready var dialog_box_scene = preload("res://Levels/dialogo_box.tscn")
var menssage_lines : Array[String] = []
var current_line = 0

var dialog_box
var dialog_box_position := Vector2.ZERO

var is_message_active := false
var can_advance_message := false

func start_messagem(position: Vector2, lines: Array[String]):
	if is_message_active:
		return
	
	menssage_lines = lines
	dialog_box = position
	show_text()
	is_message_active = true
	
func show_text():
	dialog_box = dialog_box_scene.instantiate()
	dialog_box.text_display_finished.connect(_on_all_text_displayed)
	get_tree().root.add_child(dialog_box)
	dialog_box.global_position = dialog_box_position
	dialog_box.display_text(menssage_lines[current_line])
	can_advance_message = false
	
func _on_all_text_displayed():
	can_advance_message = true
	
func _unhandled_input(event):
	if (event.is_action_pressed("avançar_text") && is_message_active && can_advance_message):
		dialog_box.queue_free()
		current_line += 1
		if current_line >= menssage_lines.size():
			is_message_active = false
			current_line = 0
			return
		show_text()

