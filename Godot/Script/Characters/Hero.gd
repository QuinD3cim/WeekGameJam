extends KinematicBody2D


## Signals ##

signal dead


## Variables ##

# Stats of the character
var stats                      # Current hero stat levels

# Dynamic Values
var velocity = Vector2.ZERO
var knockback = Vector2.ZERO
var rollVector = Vector2.DOWN
var collider
var mouseDirection
var attackDirection

# Animation States
onready var animationTree = $AnimationTree
onready var stateMachine = animationTree.get("parameters/playback")
enum {
	MOVE,
	ROLL,
	MELEE,
	DISTANCE,
	KNOCKBACK
}
var playerState = MOVE

# Bow
export (PackedScene) var arrow
var shoot = true
var cursorMove = true
onready var shootTimer = $BowPivot/ArrowSpawn/BowTimer
onready var arrowSpawn = $BowPivot/ArrowSpawn
onready var bowPivot = $BowPivot


## Functions ##

func _ready():
	$Sprite.texture = load("res://Art/CharSprites/"+State.villagersAlive.currentHero+".png")
	stats = State.currentStats
	animationTree.active = true
	$HitboxPivot/Sword/SwordAttack.disabled = true
	stateMachine.start("Idle")

func _physics_process(delta) -> void:
	mouseDirection = (get_global_mouse_position()-global_position).normalized()
	if cursorMove:
		bowPivot.rotation = mouseDirection.angle()
	
	match playerState:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		MELEE:
			melee_state(delta)
		DISTANCE:
			distance_state(delta)
		KNOCKBACK:
			knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
			collider = move_and_collide(knockback)
			if knockback == Vector2.ZERO :
				playerState = MOVE

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
		rollVector = input
	else :
		velocity = velocity.move_toward(Vector2.ZERO,((stats.speed*15+100)/4)*delta)
		stateMachine.travel("Idle")

	collider = move_and_collide(velocity)

	#Attack or roll
	if Input.is_action_pressed("melee_attack") :
		attackDirection = mouseDirection
		playerState = MELEE
	if shoot and Input.is_action_just_pressed("distance_attack") :
		attackDirection = mouseDirection
		playerState = DISTANCE
	if Input.is_action_pressed("roll") :
		playerState = ROLL

func roll_state(delta) -> void :
	velocity = rollVector * (stats.speed*15+100) * 1.5 * delta
	stateMachine.travel("Roll")
	collider = move_and_collide(velocity)
	
func melee_state(_delta) -> void:
	animationTree.set("parameters/Melee/blend_position", attackDirection)
	velocity = Vector2.ZERO
	stateMachine.travel("Melee")

func distance_state(_delta) -> void:
	if shoot :
		animationTree.set("parameters/Distance/blend_position", attackDirection)
		shoot = false
		cursorMove = false
		stateMachine.travel("Distance")
		velocity = Vector2.ZERO

#When animation is finished
func animation_finished() -> void:
	playerState = MOVE

func make_bullet():
	var a = arrow.instance()
	owner.add_child(a)
	a.player = self
	a.transform = arrowSpawn.global_transform
	shootTimer.start()
	cursorMove = true

func reloaded():
	shoot = true

func _on_Sword_area_entered(area):
	area.owner.hurt("sword",global_position,stats.strength,self)

func _on_HurtBox_area_entered(area):
	stats.currentHealth -= area.owner.attack
	if (stats.currentHealth < 0) :
		emit_signal("dead")
		queue_free()
	else :
		repulse(area)

func _on_Invicibility_timeout():
	$HurtBox.set_collision_layer_bit(2,true)
	set_collision_mask_bit(3,true)

func repulse(area):
	knockback = (global_position-area.global_position).normalized()*15
	animationTree.set("parameters/Hurt/blend_position", knockback)
	stateMachine.travel("Hurt")
	playerState = KNOCKBACK
	$HurtBox.set_collision_layer_bit(2,false)
	set_collision_mask_bit(3,false)
	$Invicibility.start()
