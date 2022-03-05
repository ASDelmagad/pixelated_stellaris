extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var settings = {
	"GameplaySettings":{
		
	},
	"VideoSettings":{
		"Resolution":[1920, 1080],
		"FullScreen":true
	},
	"SoundSettings":{
		
	}
}
var settingsFile = ConfigFile.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	loadSettingsFile(settingsFile, "res://settings.cfg")
	
	applySettings()

func _exit_tree():
	settingsFile.save("res://settings.cfg")

func loadSettingsFile(settingsVar: ConfigFile, file: String):
	settingsVar.load(file)
	
	for section in settings.keys():
		print(section)
		for key in settings[section].keys():
			print(key)
			if !settingsVar.has_section_key(section, key):
				settingsVar.set_value(section, key, settings[section][key])
			else:
				settings[section][key] = settingsVar.get_value(section, key)
	
	settingsVar.save(file)

func applySettings():
	var videoSettings: Dictionary = settings['VideoSettings']
	var resolution: Array = videoSettings['Resolution']
	var fullScreen = videoSettings['FullScreen']
	
	OS.window_size = Vector2(resolution[0], resolution[1])
	OS.window_fullscreen = fullScreen
	
	$"TabContainer/Video Settings/ScrollContainer/VBoxContainer/HBoxContainer/Resolutions".resolution_loaded(resolution)
	$"TabContainer/Video Settings/ScrollContainer/VBoxContainer/HBoxContainer/FullScreen".fullscreen_loaded(fullScreen)

func setSetting(section, key, value):
	settings[section][key] = value
	settingsFile.set_value(section, key, value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
