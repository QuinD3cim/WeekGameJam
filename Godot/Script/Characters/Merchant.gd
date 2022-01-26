extends StaticBody2D


onready var pnjName = name
export (bool) var merchant
var talking = false
var textFinished = false
onready var dialogBox = get_child(0).get_child(0)

func _ready():
	$Sprite.texture = load("res://Art/CharSprites/"+pnjName+".png")
	if !State.villagersAlive[pnjName] :
		queue_free()


func talk():
	if !talking:
		dialogBox.visible = true
		dialogBox._launch_dialog(pnjName)
		talking = true
	if talking and textFinished:
		dialogBox.visible = false
		get_child(1)._on_end_dialogue()
		talking = false
		textFinished = false

func sell():
	pass

func _on_DialogText_end_text():
	textFinished = true
