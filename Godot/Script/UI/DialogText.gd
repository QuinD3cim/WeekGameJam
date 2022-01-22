extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var timer = $TextTimer
signal end_text
signal mark_appear

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible_characters(0)
	timer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	if get_visible_characters() > get_total_character_count():
		timer.stop()
		emit_signal("mark_appear")


func click():
		if get_visible_characters() >= get_total_character_count():
			set_visible_characters(0)
			emit_signal("end_text")
		else:
			set_visible_characters(get_total_character_count())
			emit_signal("mark_appear")
		timer.stop()


func input_text(string):
	set_bbcode(string)
	set_visible_characters(0)
	timer.start()
