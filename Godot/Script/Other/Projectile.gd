extends Area2D


## Signals ##


## Variables ##

export (int) var speed = 750


## Functions ##

# Function called when the scene is charged
func _ready():
	pass

# Function called every frame
# delta : time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta

# Custom function called when bullet hits something
# body : what is hit
func body_touched(body):
	if body.is_in_group("mob"):
		body.queue_free()

# Function generated with Node Signals when body exits screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Projectile_area_entered(area):
	area.owner.hurt("arrow",global_position,State.currentStats.dexterity)
	queue_free()
