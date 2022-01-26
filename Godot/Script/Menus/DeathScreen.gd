extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var charList = State.Villagers
onready var state = State.villagersAlive
onready var stats = State.currentStats
onready var scrolldown = $CharacterSelectScrolldown
onready var gold = $GoldText

onready var healthText = $StatHandler/HealthText
onready var strengthText = $StatHandler/StrengthText
onready var dextText = $StatHandler/DextText
onready var speedText = $StatHandler/SpeedText

onready var healthButton = $StatHandler/HealthButton
onready var strengthButton = $StatHandler/StrengthButton
onready var dextButton = $StatHandler/DextButton
onready var speedButton = $StatHandler/SpeedButton

onready var healthGold = $StatHandler/HealthGold
onready var strengthGold = $StatHandler/StrengthGold
onready var dextGold = $StatHandler/DextGold
onready var speedGold = $StatHandler/SpeedGold

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (0,charList.size()):
		if state[charList[i]] == false :
			scrolldown.set_item_disabled(i,true)
	
	update_all()


func update_all():
	healthGold.set_text("0")
	strengthGold.set_text("0")
	dextGold.set_text("0")
	speedGold.set_text("0")
	
	healthText.set_text("%s" % stats.health)
	strengthText.set_text("%s" % stats.strength)
	dextText.set_text("%s" % stats.dexterity)
	speedText.set_text("%s" % stats.speed)
	
	healthButton.set_disabled(false)
	strengthButton.set_disabled(false)
	dextButton.set_disabled(false)
	speedButton.set_disabled(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
