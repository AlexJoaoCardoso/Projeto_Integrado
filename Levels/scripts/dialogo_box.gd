extends MarginContainer

@onready var mensage = $label_margin/mensage
@onready var timer = $Timer



const max_witdh = 256

var text = ""
var letter_index = 0

var letter_display_timer := 0.07
var space_display_timer := 0.05
var puntuaction_display_timer := 0.02

signal text_display_finished()

func display_text(text_to_display: String):
	text = text_to_display
	mensage.text = text_to_display
	
	await resized
	
	custom_minimum_size.x =min(size.x,max_witdh)
	
	if size.x > max_witdh:
		mensage.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
		
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	mensage.text = ""
	display_letter()
	
func display_letter():
	mensage.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		text_display_finished.emit()
		return
	
	match text[letter_index]:
		"!","?",",",".":
			letter_display_timer.start(puntuaction_display_timer)
		" ":
			letter_display_timer.start(space_display_timer) 
		_:
			letter_display_timer.start(letter_display_timer)




func _on_timer_timeout():
	display_letter()
	
