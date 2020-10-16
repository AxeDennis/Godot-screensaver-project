extends Label

var dead = 0

func _process(_delta):
	set_text("Dead: " + str(dead))
