extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var box = $DialogBox
var dialog = DialogFile

# Called when the node enters the scene tree for the first time.
func _ready():
	_launch_dialog("Archer")

func _launch_dialog(character): #to replace with the appropriate on signal
	box.display(dialog.get_dialog(character),character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
