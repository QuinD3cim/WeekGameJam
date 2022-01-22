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
var collision
var velocity = Vector2.ZERO

onready var sprite = $Sprite
onready var stunTimer = $HurtBox/Stun
onready var detection = $PlayerDetection

# States
enum {
	IDLE,
	WANDER,
	CHASE
}
var state = IDLE

# Called when the node enters the scene tree for the first time.
func _ready():
	attack = 75*level
	speed = 100*level
	life =  300*level

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
	collision = move_and_collide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, speed*delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player = detection.player
			if player != null and move:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction*speed/50,speed*delta)
			else :
				state = IDLE
	
	collision = move_and_collide(velocity)

func seek_player():
	if detection.can_see():
		state = CHASE

func hurt(weapon,heroPosition, damage):
	if(weapon == "sword"):
		knockback = (global_position-heroPosition).normalized()*20
		life -= damage*35
		move = false
	else :
		life -= damage*20
	if life < 1 :
		queue_free()
	else :
		sprite.modulate = Color(0.97,0.44,0.44,1)
		stunTimer.start()

func _on_Stun_timeout():
	sprite.modulate = Color(1,1,1,1)
	move = true
