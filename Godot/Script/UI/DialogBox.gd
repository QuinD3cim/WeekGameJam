extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var text = $DialogText
onready var text_name = $Name
onready var portrait = $Portrait
onready var mark = $Mark

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false)
	change_visibility(false)
	mark.set_visible(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func display(string,character):
	portrait.texture = load("res://Art/CharSprites/"+character+".png")
	change_visibility(true)
	mark.set_visible(false)
	text.input_text(string)
	text_name.set_bbcode(character)
	set_process_input(true)


func change_visibility(boolean):
	self.set_visible(boolean)
	text_name.set_visible(boolean)
	portrait.set_visible(boolean)


func _on_DialogText_end_text():
	set_process_input(false)
	change_visibility(false)
	mark.set_visible(false)


func _input(_event):
	if  Input.is_mouse_button_pressed(1):
		text.click()


func _on_DialogText_mark_appear():
	mark.set_visible(true)
