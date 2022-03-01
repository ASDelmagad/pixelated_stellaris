extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fileLocation = "user://settings.cfg"

var settings = {
	"GameplaySettings":{
		
	},
	"VideoSettings":{
		"Resolution":[640, 360],
		"FullScreen":false
	},
	"SoundSettings":{
		
	}
}
var settingsFile = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	settingsFile.load(fileLocation)
	
	loadVideoSettings(settingsFile)
	reloadSettings()

func loadVideoSettings(fileVar: ConfigFile):
	var section = "VideoSettings"
	
	for key in settings[section].keys():
		settings[section][key] = fileVar.get_value(section, key)

func reloadSettings():
	var videoSettings: Dictionary = settings['VideoSettings']
	var resolution: Array = videoSettings['Resolution']
	var fullScreen = videoSettings['Fullscreen']
	
	OS.window_size = Vector2(resolution[0], resolution[1])
	OS.window_fullscreen = fullScreen

func saveSetting(section, key, value):
	settings[section][key] = value
	settingsFile.set_value(section, key, value)
	settingsFile.save(fileLocation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
