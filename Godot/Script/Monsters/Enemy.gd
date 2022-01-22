extends KinematicBody2D


## Signals ##


## Variables ##

# Mob stats
var level = State.location.place
var life
var attack
var speed

var knockback = Vector2.ZERO
var collision


# Called when the node enters the scene tree for the first time.
func _ready():
	attack = 75*level
	speed = 100*level
	life =  300*level

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
	collision = move_and_collide(knockback)

func hurt(heroPosition, damage):
	print(damage)
	knockback = (global_position-heroPosition).normalized()*20
	life -= damage*35
	if life < 0 :
		queue_free()
