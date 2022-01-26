extends KinematicBody2D


## Signals ##


## Variables ##

# Mob stats
var life
var attack = 200

var nextPart
var previousPart
var collider

var push
var stun

var velocity = Vector2.ZERO

## Functions ##

func _ready():
	verify_parts()

func _physics_process(delta):
	
	stun = owner.stun
	
	if !stun:
		if (position.distance_to(previousPart.position) > 50):
			velocity = position.direction_to(previousPart.position)
			rotation = velocity.angle()
			collider = move_and_collide(velocity*owner.speed*delta)
		else:
			if position.distance_to(previousPart.position) < 1:
				velocity = Vector2.ZERO
			collider = move_and_collide(velocity*owner.speed*delta)
	else :
		if (position.distance_to(previousPart.position) < 50):
			velocity = -position.direction_to(previousPart.position)
			collider = move_and_collide(velocity*owner.speed*delta)

func verify_parts():
	if get_position_in_parent() != 0 :
		nextPart = owner.get_child(get_position_in_parent()-1)
	previousPart = owner.get_child(get_position_in_parent()+1)
