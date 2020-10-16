extends Label

var infected = 0

func _process(_delta):
	set_text("Infected: " + str(infected))