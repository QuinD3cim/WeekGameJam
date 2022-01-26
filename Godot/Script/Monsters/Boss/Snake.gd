extends Node2D

var health = 10000

var speed = 600
var attack = 450
var stun = false
var playerPosition

func _physics_process(_delta):
	if owner.find_node("Hero") != null :
		playerPosition = owner.find_node("Hero").position

func hurt(weapon, _heroPosition, damage, _hero):
	if stun:
		if(weapon == "sword"):
			health -= damage*35
		else :
			health -= damage*20
		print("ouch")
		print(health)

func end():
	queue_free()
