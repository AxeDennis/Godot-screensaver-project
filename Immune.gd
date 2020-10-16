extends Label

var immune = 0

func _process(_delta):
	set_text("Immune: " + str(immune))