extends KinematicBody2D


## Signals ##

signal dead


## Variables ##

# Mob stats
var life

var collision
var velocity = Vector2.ZERO
var player
var nbBounce
var bounces

export (bool) var battleStart = true

onready var cast1 = $RayCast2D
onready var cast2 = $RayCast2D2
onready var timer = $Timer
onready var nextPart = owner.get_child(get_position_in_parent()-1)
onready var animationTree = owner.get_child(1)
onready var stateMachine = animationTree.get("parameters/playback")

# States
enum {
	MOVE,
	RUSH,
	DEAD
}
var state = MOVE


## Functions ##

func _ready():
	randomize()
	velocity = Vector2(rand_range(-1,1),rand_range(-1,1)).normalized()
	animationTree.active = true
	stateMachine.start("Idle")
	nbBounce = randi()%6 + 5
	bounces = 0
	

func _physics_process(delta):
	
	if owner.health < 0:
		state = DEAD
	
	if battleStart :
		
		match state:
			MOVE:
				if collision :
					bounces += 1
					stateMachine.travel("Idle")
					velocity = velocity.bounce(collision.normal)
				rotation = velocity.angle()
				cast1.cast_to = Vector2(owner.speed,0)
				cast2.cast_to = Vector2(owner.speed,0)
				if cast1.get_collider() or cast2.get_collider():
					stateMachine.travel("Attack")
					owner.speed = 850
				collision = move_and_collide(velocity*owner.speed*delta)
				if stateMachine.get_current_node() != "Attack":
					owner.speed = 600
				if bounces == nbBounce:
					state = RUSH
					velocity = Vector2.ZERO
					stateMachine.travel("Rush")
			RUSH:
				if !owner.stun:
					collision = move_and_collide(velocity*owner.speed*delta)
					if collision:
						owner.speed = 300
						owner.attack = 450
						velocity = Vector2.ZERO
						stateMachine.travel("Stun")
						owner.stun = true
						timer.start(2)
			DEAD:
				stateMachine.travel("Dead")


func find_player():
	owner.speed = 2000
	owner.attack = 1000
	velocity = global_position.direction_to(owner.playerPosition)
	rotation = velocity.angle()
	stateMachine.travel("Attack")

func stunOver():
	owner.stun = false
	stateMachine.travel("Idle")
	state = MOVE
	velocity = Vector2(rand_range(-1,1),rand_range(-1,1)).normalized()
	nbBounce = randi()%6 + 5
	bounces = 0
