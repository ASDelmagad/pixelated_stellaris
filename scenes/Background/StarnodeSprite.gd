extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var animations = frames.get_animation_names()
	var animation_id = random_int(0, animations.size()-1)
	
	self.animation = animations[animation_id]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func random_int(Min, Max):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var value = rng.randi_range(Min, Max)
	
	return value
