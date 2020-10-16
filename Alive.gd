extends Label

var alive = 100

func _process(_delta):
	set_text("Alive: " + str(alive))