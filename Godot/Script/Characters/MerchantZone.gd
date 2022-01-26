extends Area2D

var talk = false
var alreadyTalk = false
var player
onready var parent = get_parent()

func _on_MerchantZone_body_entered(body):
	talk = true
	player = body

func _physics_process(_delta):
	if talk :
		if Input.is_action_just_pressed("melee_attack"):
			parent.talk()
			if !alreadyTalk :
				player.playerState = 5
				alreadyTalk = true
		if Input.is_action_just_pressed("distance_attack") and parent.merchant == true:
			parent.sell()
			if !alreadyTalk :
				player.playerState = 5
				alreadyTalk = true


func _on_MerchantZone_body_exited(_body):
	talk = false
	player = null
	alreadyTalk = false


func _on_end_dialogue():
	player.playerState = 0
