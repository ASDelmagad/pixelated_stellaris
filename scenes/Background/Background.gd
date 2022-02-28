extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	create_random_star()
	pass # Replace with function body.

func _on_StarNode_animation_finished(child):
	self.remove_child(child)
	

func create_random_star():
	var starNode: Node2D = load("scenes/Background/StarNode.tscn").instance()
	
	self.add_child(starNode)
	starNode.connect("animation_finished", self, "_on_StarNode_animation_finished")
	
	starNode.position = random_position(self.get_rect().size.x, self.get_rect().size.y)
	
func random_position(x, y):
	return Vector2(random_float(0, x), random_float(0, y))

func random_float(Min, Max):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var value = rng.randf_range(Min, Max)
	
	return value
