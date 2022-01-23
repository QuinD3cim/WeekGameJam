extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var hp = $HealthBar
onready var experience = $EXPCount
onready var gold = $GoldCount/GoldAmount
onready var stats = State.currentStats

# Called when the node enters the scene tree for the first time.
func _ready():
	hp.value = stats.currentHealth/stats.health
	experience.set_text( "EXP: %s / %s" % [stats.currentEXP , stats.nextLevelEXP])
	gold.set_text("%s" % stats.gold)


func _damage_taken(): #to replace with on signal for damages
	hp.value = stats.currentHealth/stats.health

func _exp_gain(): #to replace with on signal for exp
	experience.set_text( "EXP: %s / %s" % [stats.currentEXP , stats.nextLevelEXP])
	
func _gold_gain(): #to replace with on signal for gold
	gold.set_text("%s" % stats.gold)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
