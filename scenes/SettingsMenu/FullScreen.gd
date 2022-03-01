extends CheckButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().get_nodes_in_group("settings")[0]
	self.toggle_mode = OS.window_fullscreen

func _on_FullScreen_toggled(button_pressed):
	root.saveSetting("VideoSettings", "FullScreen", button_pressed)
	OS.window_fullscreen = button_pressed
