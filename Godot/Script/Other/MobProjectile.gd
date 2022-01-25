extends Node2D


## Signals ##


## Variables ##

export (int) var speed = 750
var attack
onready var projectile = $Projectile


## Functions ##

# Function called when the scene is charged
func _ready():
	pass

# Function called every frame
# delta : time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta

# Function generated with Node Signals when body exits screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Projectile_area_entered(_area):
	queue_free()
