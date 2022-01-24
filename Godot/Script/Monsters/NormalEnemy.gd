extends KinematicBody2D


## Signals ##


## Variables ##

# Mob stats
var level = State.location.place
var life
var attack
var speed

var knockback = Vector2.ZERO
var move = true
var aggro = false
var collision
var velocity = Vector2.ZERO
var player

onready var sprite = $Sprite
onready var detection = $PlayerDetection

# States
onready var animationTree = $AnimationTree
onready var stateMachine = animationTree.get("parameters/playback")
enum {
	IDLE,
	WANDER,
	CHASE
}
var state = IDLE


## Functions ##

# Called when the node enters the scene tree for the first time.
func _ready():
	attack = 130*level
	speed = 110*level
	life =  300*level
	
	animationTree.active = true
	stateMachine.start("Idle")

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
	collision = move_and_collide(knockback)

	match state:
		IDLE:
			stateMachine.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, speed*delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			if !aggro :
				player = detection.player
			if player != null and move:
				if ((player.global_position - global_position).length() < 60) :
					animationTree.set("parameters/Attack/blend_position", (player.global_position - global_position).normalized())
					velocity = velocity.move_toward(Vector2.ZERO, speed*delta)
					move = false
					stateMachine.travel("Attack")
				else :
					var direction = (player.global_position - global_position).normalized()
					velocity = velocity.move_toward(direction*speed/50,speed*delta)
			else :
				state = IDLE
	
	collision = move_and_collide(velocity)

func animation_finished():
	move = true
	stateMachine.travel("Idle")

func seek_player():
	if detection.can_see():
		state = CHASE

func hurt(weapon,heroPosition, damage, hero):
	if(weapon == "sword"):
		knockback = (global_position-heroPosition).normalized()*20
		life -= damage*35
		move = false
	else :
		life -= damage*20
		
	if life < 1 :
		queue_free()
	else :
		aggro = true
		state = CHASE
		player = hero
		stateMachine.travel("Hurt")

func _on_AttackZone_body_entered(_body):
	$PivotPoint/AttackZone/AttackCollision.disabled = true
