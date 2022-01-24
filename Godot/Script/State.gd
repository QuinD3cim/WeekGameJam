extends Node


## Variables ##

var location = {
	"place" : 1
}

# Hero stats
var currentStats = {                  # Current hero stat levels
	"health" : 5,
	"currentHealth" : 500,
	"strength" : 5,                   # *35 for damage
	"dexterity" : 5,
	"speed" : 5,
	"gold": 0,
	"currentEXP": 0,
	"nextLevelEXP": 10,
}

# Village levels
var villageLevels = {
	"blacksmithLevel" : 1,               # Current blacksmith level
	"armourerLevel" : 1,                 # Current armourer level
	"shoemakerLevel" : 1,                # Current shoemaker level
	"herbalistLevel" : 1                 # Current herbalit level
	}

var Villagers = ["Hero","Archer","Granny","Merchant","Sister","Smith"]
var villagersAlive = {
	"deathCount" : 0,
	"currentHero" : "Hero",
	"Hero" : true,
	"Archer" : true,
	"Granny" : true,
	"Merchant" : true,
	"Sister" : true,
	"Smith" : true 
}
