extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var hp = $HealthBar
onready var stats = State.currentStats

# Called when the node enters the scene tree for the first time.
func _ready():
	hp.value = stats.currentHealth/stats.health


func _damage_taken(): #to replace with on signal for damages
	hp.value = stats.currentHealth/stats.health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
