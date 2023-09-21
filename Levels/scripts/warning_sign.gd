extends Node2D


@onready var texture = $texture
@onready var area_sign = $area_sign

const lines : Array[String] = [
	"Ola, Player do meu coração!!",
	"É muito bom ver você por aqui",
	"Eu sinceramente espero que esteja preparado",
	"Para a sua maior aventura contra a Igreja KKKK (Risada malefica)",
	"Bom talvez sua jornada esteja apenas, HMMMM ...",
	"... COMEÇANDOOOOOO!!!!!",
	"AVANÇE E CONCLUA OS PUZZLES",
	"TALVEZ VOCÊ NÃO CONSIGA",
	"PROVE QUE EU ESTOU ERRADO",	
]

func _unhandled_input(event):
	if area_sign.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interação") && !DialgoMenager.is_message_active:
			texture.hide()
			DialgoMenager.start_messagem(global_position, lines)
	else:
		texture.hide()
		if DialgoMenager.dialog_box != null:
			DialgoMenager.dialog_box.queue_free()
			DialgoMenager.is_message_active = false
