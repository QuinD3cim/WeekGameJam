extends KinematicBody2D


## Signals ##


## Variables ##

# Stats of the character
var stats                      # Current hero stat levels

# Dynamic Values
var health                     # Current hero health
var velocity = Vector2.ZERO
var rollVector = Vector2.DOWN
var collider

# Animation States
onready var animationTree = $AnimationTree
onready var stateMachine = animationTree.get("parameters/playback")
enum {
	MOVE,
	ROLL,
	ATTACK
}
var playerState = MOVE


## Functions ##

func _ready():
	stats = State.currentStats
	animationTree.active = true
	stateMachine.start("Idle")
	$HeroCollision.disabled = true

func _physics_process(delta) -> void:
	match playerState:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)

func move_state(delta) -> void:

	#Movement
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	input = input.normalized()

	if input.length() != 0:
		velocity += input*((stats.speed*15+100)/4)*delta
		velocity = velocity.clamped((stats.speed*15+100)*delta)
		stateMachine.travel("Move")
		animationTree.set("parameters/Idle/blend_position", input)
		animationTree.set("parameters/Move/blend_position", input)
		animationTree.set("parameters/Roll/blend_position", input)
		animationTree.set("parameters/Attack/blend_position", input)
		rollVector = input
	else :
		velocity = velocity.move_toward(Vector2.ZERO,((stats.speed*15+100)/4)*delta)
		stateMachine.travel("Idle")

	collider = move_and_collide(velocity)

	#Attack or roll
	if Input.is_action_pressed("melee_attack") :
		playerState = ATTACK
	if Input.is_action_pressed("roll") :
		playerState = ROLL

func roll_state(delta) -> void :
	velocity = rollVector * (stats.speed*15+100) * 1.5 * delta
	stateMachine.travel("Roll")
	collider = move_and_collide(velocity)

func attack_state(delta) -> void:
	velocity = Vector2.ZERO
	stateMachine.travel("Attack")

#When animation is finished
func animation_finished() -> void:
	playerState = MOVE
