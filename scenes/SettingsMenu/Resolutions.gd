extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root = get_tree().get_root()

var resolutions = [
	[640, 360],
	[960, 540],
	[1280, 720],
	[1920, 1080],
	[2560, 1440],
	[3200, 1800],
	[3840, 2160]
]
var resolution = [640, 360]

var section = "VideoSettings"
var key = "Resolution"


# Called when the node enters the scene tree for the first time.
func _ready():
	resolution = root.settings[section][key]
	
	for i in range(0, resolutions.count()):
		self.add_item("{}x{}".format(resolutions[i][0], resolutions[i][1]), i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OptionButton_item_selected(id):
	var value = [resolutions[id][0], resolutions[id][1]]
	
	resolution = value
	root.saveSetting(section, key, value)
