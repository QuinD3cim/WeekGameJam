extends Node


## Variables ##

# Hero stats
var currentStats = {                  # Current hero stat levels
	"health" : 5,
	"currentHealth" : 500,
	"strength" : 5,
	"dexterity" : 5,
	"speed" : 5
}

# Village levels
var villageLevels = {
	"blacksmithLevel" : 1,               # Current blacksmith level
	"armourerLevel" : 1,                 # Current armourer level
	"shoemakerLevel" : 1,                # Current shoemaker level
	"herbalistLevel" : 1                 # Current herbalit level
	}

var villagersAlive = {
	"currentHero" : "hero",
	"hero" : 1,
	"blacksmith" : 1,
	"granny" : 1
}
