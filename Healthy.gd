extends Label

var healthy = 0

func _process(_delta):
	set_text("Healthy: " + str(healthy))