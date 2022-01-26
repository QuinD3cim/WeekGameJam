extends CanvasLayer

signal scene_changed()

onready var animationPlayer = $AnimationPlayer
onready var black = $Control/Black

# Called when the node enters the scene tree for the first time.
func change_scene(path, delay = 0.5):
	
	if path != "res://Scenes/Levels/Village.tscn":
		State.location.place += 1
	else :
		State.location.place = 0
		
	State.location.charging = true
	yield(get_tree().create_timer(delay), "timeout")
	animationPlayer.play("fade")
	yield(animationPlayer,"animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animationPlayer.play_backwards("fade")
	yield(animationPlayer,"animation_finished")
	emit_signal("scene_changed")
	State.location.charging = false
