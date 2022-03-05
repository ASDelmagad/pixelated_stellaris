extends OptionButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root = 0

var resolutions = [
	[640, 360],
	[960, 540],
	[1280, 720],
	[1920, 1080],
	[2560, 1440],
	[3200, 1800],
	[3840, 2160]
]
var resolution = [1920, 1080]


# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().get_nodes_in_group("settings")[0]
	
	resolution = root.settings["VideoSettings"]["Resolution"]
	
	for i in range(0, resolutions.size()):
		var width = resolutions[i][0]
		var height = resolutions[i][1]
		
		self.add_item("{0}x{1}".format([width, height]), i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_OptionButton_item_selected(id):
	var value = [resolutions[id][0], resolutions[id][1]]
	
	resolution = value
	root.setSetting("VideoSettings", "Resolution", value)
	set_resolution(value)

func resolution_loaded(value):
	resolution = value
	
	for i in range(0, resolutions.size()):
		var width = resolutions[i][0]
		var height = resolutions[i][1]
		
		if resolution[0] == width && resolution[1] == height:
			self.selected = i

func set_resolution(value):
	OS.window_size = Vector2(value[0], value[1])


func _on_FullScreen_toggled(button_pressed):
	set_resolution(resolution)
