extends Label

onready var infected = get_node("..")

func _process(_delta):
	set_text(infected.nr_of_infected)