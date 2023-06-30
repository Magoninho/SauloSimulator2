extends Node2D

# Called when the node enters the scene tree for the first time.
func start_all_carboxilas():
	for c in self.get_children():
		c.start()
