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
onready var wander = $WanderController

# States
onready var animationTree = $AnimationTree
onready var stateMachine = animationTree.get("parameters/playback")
enum {
	IDLE,
	WANDER,
	CHASE,
	DEAD
}
var state = IDLE


## Functions ##

# Called when the node enters the scene tree for the first time.
func _ready():
	attack = 120*level
	speed = 90*level
	life =  600*level
	sprite.texture = load("res://Art/MobSprites/goblinarmored"+str(State.location.place)+".png")
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
			
			if wander.time_left() == 0:
				state = pick_random_state([IDLE,WANDER])
				wander.start_wander_timer(rand_range(1,3))
		WANDER:
			seek_player()
			if wander.time_left() == 0:
				state = pick_random_state([IDLE,WANDER])
				wander.start_wander_timer(rand_range(1,3))
				
			var direction = global_position.direction_to(wander.targetPosition)
			animationTree.set("parameters/Move/blend_position", direction.normalized())
			animationTree.set("parameters/Idle/blend_position", direction.normalized())
			stateMachine.travel("Move")
			velocity = velocity.move_toward(direction*speed/75,speed*delta)
			
			if global_position.distance_to(wander.targetPosition) <= speed/75 :
				stateMachine.travel("Idle")
				state = pick_random_state([IDLE,WANDER])
				wander.start_wander_timer(rand_range(1,3))
		CHASE:
			if !aggro :
				if (detection.player != null) :
					player = detection.player
			animationTree.set("parameters/Move/blend_position", (player.global_position - global_position).normalized())
			if player != null and move:
				animationTree.set("parameters/Attack/blend_position", (player.global_position - global_position).normalized())
				animationTree.set("parameters/Idle/blend_position", (player.global_position - global_position).normalized())
				if ((player.global_position - global_position).length() < 80) :
					velocity = velocity.move_toward(Vector2.ZERO, speed*delta)
					stateMachine.travel("Attack")
					move = false
				else :
					stateMachine.travel("Move")
					var direction = (player.global_position - global_position).normalized()
					velocity = velocity.move_toward(direction*speed/50,speed*delta)
			elif !move :
				velocity = velocity.move_toward(Vector2.ZERO, speed*delta)
			else :
				state = IDLE
		DEAD:
			velocity = Vector2.ZERO
			stateMachine.travel("Dead")
	
	collision = move_and_collide(velocity)

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func animation_finished():
	move = true
	stateMachine.travel("Idle")

func seek_player():
	if detection.can_see():
		state = CHASE

func hurt(weapon,heroPosition, damage, hero):
	if(weapon == "sword"):
		knockback = (global_position-heroPosition).normalized()*10
		life -= damage*35
		move = false
	else :
		life -= damage*20
		
	if life < 1 :
		state = DEAD
	else :
		aggro = true
		state = CHASE
		player = hero
		animationTree.set("parameters/Hurt/blend_position", (hero.global_position - global_position).normalized())
		stateMachine.travel("Hurt")

func _on_AttackZone_body_entered(_body):
	$PivotPoint/AttackZone/AttackCollision.disabled = true

func die():
	queue_free()
