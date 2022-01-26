extends Node


var ArmorerDialogs = {
	1 : "I recognize you. I guess you failed... Remember what I taught you. Think clear, fight any darkness troubling your mind and let the light guide your sword.",
	2 : "I recognize you. I guess you failed... Remember what I taught you. Think clear, fight any darkness troubling your mind and let the light guide your sword.",
	3 : "Is the darkness taking over your mind? Can you still see the light? Shall we train together once more for you to shine anew?",
	4 : "Is the darkness taking over your mind? Can you still see the light? Shall we train together once more for you to shine anew?",
	5 : "Is the darkness taking over your mind? Can you still see the light? Shall we train together once more for you to shine anew?",
	6 : "Darkness is taking over... life's leaving this land and with it every grace is dying... Stay with me, don't go.... I need you...",
	7 : "Darkness is taking over... life's leaving this land and with it every grace is dying... Stay with me, don't go.... I need you...",
	8 : "Darkness... all around us... I can't see... All I can hear is a deafening silence... Where did you go? What happened? Have they won already? ",
	9 : "Dark.... Darker.... Yet darker... "
}

var GrannyDialogs = {
	1 : "I saw most of the people in this village grow up, watching them die is no easy task for me, my child...",
	2 : "I saw most of the people in this village grow up, watching them die is no easy task for me, my child...",
	3 : "I saw most of the people in this village grow up, watching them die is no easy task for me, my child...",
	4 : "Child... Wouldn't you do an old woman a favour, and prevent her from having to watch her friends die?",
	5 : "Child... Wouldn't you do an old woman a favour, and prevent her from having to watch her friends die?",
	6 : "Child... Wouldn't you do an old woman a favour, and prevent her from having to watch her friends die?",
	7 : "I appreaciate you protecting me, child, but my time would have come soon anyway... let those who have a future live, and let the elders protect them as well as they can...",
	8 : "I appreaciate you protecting me, child, but my time would have come soon anyway... let those who have a future live, and let the elders protect them as well as they can...",
	9 : "Child... I don't understand... You could have taken me instead of the others! Don't you want this village to have a future? I had less time left on this earth than anyone else here!"
}

var HerbalistDialogs = {
	1 : "Oh hello... Hero... It is a bit weird... I really feel bad for... you know what? Forget that, you are here to save us all, as long as you save him, everything's going to be ok, right?",
	2 : "Oh hello... Hero... It is a bit weird... I really feel bad for... you know what? Forget that, you are here to save us all, as long as you save him, everything's going to be ok, right?",
	3 : "Oh hello... Hero... It is a bit weird... I really feel bad for... you know what? Forget that, you are here to save us all, as long as you save him, everything's going to be ok, right?",
	4 : "Oh hello... Hero... It is a bit weird... I really feel bad for... you know what? Forget that, you are here to save us all, as long as you save him, everything's going to be ok, right?",
	5 : "Oh hello... Hero... It is a bit weird... I really feel bad for... you know what? Forget that, you are here to save us all, as long as you save him, everything's going to be ok, right?",
	6 : "You... keep protecting us... you will succeed soon, won't you? you won't.... I trust you Hero, I know you can do it...",
	7 : "Hero... In the case you'd die again... I feel so selfish... but I dont' want to... I can't ask that... but maybe I could ask you... to save...",
	8 : "Hero... Listen to me... I don't care what he said... I can't... without... choose me instead, I beg you... don't...",
	9 : "Hero... Listen to me... I don't care what he said... I can't... without... choose me instead, I beg you... don't..."
}

var ArcherDialogs = {
	1 : "Nephew, in these dark times, I can only but hope I was good enough of a father for you. My faith in you won't flinch, whatever happens, I swore it to the forest!",
	2 : "Nephew, in these dark times, I can only but hope I was good enough of a father for you. My faith in you won't flinch, whatever happens, I swore it to the forest!",
	3 : "Nephew, in these dark times, I can only but hope I was good enough of a father for you. My faith in you won't flinch, whatever happens, I swore it to the forest!",
	4 : "Nephew, in these dark times, I can only but hope I was good enough of a father for you. My faith in you won't flinch, whatever happens, I swore it to the forest!",
	5 : "Nephew, in these dark times, I can only but hope I was good enough of a father for you. My faith in you won't flinch, whatever happens, I swore it to the forest!",
	6 : "Nephew, I appreciate you protecting me, but I also know my hunting skills could be useful to your quest... Promise me to make your choices without letting our bond rig your judgement.",
	7 : "Nephew, I appreciate you protecting me, but I also know my hunting skills could be useful to your quest... Promise me to make your choices without letting our bond rig your judgement.",
	8 : "Nephew, I appreciate you protecting me, but I also know my hunting skills could be useful to your quest... Promise me to make your choices without letting our bond rig your judgement.",
	9 : "Nephew... It would appear we reached an end... I'm proud of you and I'll always love you. May your heart lead you to success and bring justice to all those who died at the hands of those monsters. Go now, and never look back,  I'll always be with you."
}

var MerchantDialogs = {
	1 : "Hero! Dear, dear, deeeeeear Hero! I know what happened was only a little mistake wasn't it? We wouldn't want to see more of our little sheeps fall, would we?",
	2 : "Hero! Dear, dear, deeeeeear Hero! I know what happened was only a little mistake wasn't it? We wouldn't want to see more of our little sheeps fall, would we?",
	3 : "Hero, Hero, Heroooooooooooo! My... friend... Hero... You're doing your best aren't you? We already lost a third of our... little sheeps, and I'm started to get worried.",
	4 : "Hero, Hero, Heroooooooooooo! My... friend... Hero... You're doing your best aren't you? We already lost a third of our... little sheeps, and I'm started to get worried.",
	5 : "Hero! You realize our sheeps are getting eaten one by one right? Stop that right now and defeat that ennemy of yours without any more costs!",
	6 : "Hero! You realize our sheeps are getting eaten one by one right? Stop that right now and defeat that ennemy of yours without any more costs!",
	7 : "Hero! You realize our sheeps are getting eaten one by one right? Stop that right now and defeat that ennemy of yours without any more costs!",
	8 : "You want them money don't you? You're a greedy little kid, killed my sheeps one by one to steal MY money! But you won't get any of it! Not as long as I'm alive!",
	9 : "You ruined me... You killed my sheeps... Now what? You're gonna kill me? Or worst, make me poor?"
}

var RogueDialogs = {
	1 : "Hmmm... Intriguing, you're that little brat, aren't you? You just died, and you think it'll go better next time? How cute.",
	2 : "This is clearly going to be a slaughter, why don't you kill me already, spare me having to watch you fail again and again?",
	3 : "This is clearly going to be a slaughter, why don't you kill me already, spare me having to watch you fail again and again?",
	4 : "This is clearly going to be a slaughter, why don't you kill me already, spare me having to watch you fail again and again?",
	5 : "Pathetic... You really are as weak as I thought.... Can't even bring yourself to kill a criminal when he asks for it? Just let this be over already, there's nothing for me in here.",
	6 : "Pathetic... You really are as weak as I thought.... Can't even bring yourself to kill a criminal when he asks for it? Just let this be over already, there's nothing for me in here.",
	7 : "I don't think I want to talk with you right now... As you, oh generous Hero, can't come to kill me, I have some thinking to do....",
	8 : "I don't think I want to talk with you right now... As you, oh generous Hero, can't come to kill me, I have some thinking to do....",
	9 : "Hero... I just realized.... a new land.... new opportunities, a blank slate... I am not a criminal here! I can finally be free, I have a reason to live again!"
}

var ShoemakerDialogs = {
	1 : "I will pray for the soul of those you have to sacrifice, Hero... I put all my trust in you. Please consider this a way for me to lighten your burden, my own way to help.",
	2 : "I will pray for the soul of those you have to sacrifice, Hero... I put all my trust in you. Please consider this a way for me to lighten your burden, my own way to help.",
	3 : "I will pray for the soul of those you have to sacrifice, Hero... I put all my trust in you. Please consider this a way for me to lighten your burden, my own way to help.",
	4 : "I will pray for the soul of those you have to sacrifice, Hero... I put all my trust in you. Please consider this a way for me to lighten your burden, my own way to help.",
	5 : "I will pray for the soul of those you have to sacrifice, Hero... I put all my trust in you. Please consider this a way for me to lighten your burden, my own way to help.",
	6 : "Rest in peace, you'll never be forgottent... Rest in  peace, you are now a hero of this village... Rest in peace,...",
	7 : "Rest in peace, you'll never be forgottent... Rest in  peace, you are now a hero of this village... Rest in peace,...",
	8 : "Hero... I know you made tough choices so far... And I respect them all... but for once... May you let me choose? May you let me protect her? I don't think I could...",
	9 : "Hero... I know you made tough choices so far... And I respect them all... but for once... May you let me choose? May you let me protect her? I don't think I could..."
}

var SisterDialogs = {
	1 : "Is it really you, brother? I can see it, you're not realy fooling anyone. They all say you failed but I'm sure you'll get them this time! You've trained so hard to protect us!",
	2 : "Is it really you, brother? I can see it, you're not realy fooling anyone. They all say you failed but I'm sure you'll get them this time! You've trained so hard to protect us!",
	3 : "Is it really you, brother? I can see it, you're not realy fooling anyone. They all say you failed but I'm sure you'll get them this time! You've trained so hard to protect us!",
	4 : "Is it really you, brother? I can see it, you're not realy fooling anyone. They all say you failed but I'm sure you'll get them this time! You've trained so hard to protect us!",
	5 : "Why are there less and less people in here? Where are they going? They hiding? Is it a game? Oh I wanna play too!",
	6 : "Why are there less and less people in here? Where are they going? They hiding? Is it a game? Oh I wanna play too!",
	7 : "Why are there less and less people in here? Where are they going? They hiding? Is it a game? Oh I wanna play too!",
	8 : "Come on guys show yourselves, it's not fun anymore, I feel lonely in here... Brother, can you ask them to come out please?",
	9 : "Come on guys show yourselves, it's not fun anymore, I feel lonely in here... Brother, can you ask them to come out please?"
}

var SmithDialogs = {
	1 : "Hero, ye wouldnt' trick my any day! None costume canna trick my, ye still da same under. Listened dat crazy armorer didn't ye? Told ye fanatic plans would kill one day!",
	2 : "Hero, ye wouldnt' trick my any day! None costume canna trick my, ye still da same under. Listened dat crazy armorer didn't ye? Told ye fanatic plans would kill one day!",
	3 : "Hero, ye wouldnt' trick my any day! None costume canna trick my, ye still da same under. Listened dat crazy armorer didn't ye? Told ye fanatic plans would kill one day!",
	4 : "Oi Hero, wouldn't wanta tell ye how to work, but my think your plan isn't working, innit? Train with a good one, will ye? Begun thinkin' others have no good plan...",
	5 : "Oi Hero, wouldn't wanta tell ye how to work, but my think your plan isn't working, innit? Train with a good one, will ye? Begun thinkin' others have no good plan...",
	6 : "Lost it haven't they? Guess they're weak in mind... ye'll need more plans! Plans save from loosin' it!",
	7 : "Lost it haven't they? Guess they're weak in mind... ye'll need more plans! Plans save from loosin' it!",
	8 : "Why... whatye doin' Hero? Haven't no plan? Told ye, plans save! Look my, still fine aren't I?",
	9 : "No plan... dat why... no damn plan... Ye just rush without thinkin innit? Ye need a plan if ye wanna live. A plan... a plan....."
}

onready var data = State.villagersAlive
var deaths

func get_dialog(character)->String:
	deaths = data.deathCount
	
	if deaths == 0 :
		return ""
	
	match character:
		"Archer":
			match data.currentHero :
				"Granny" :
					return "Mom... I'll pray Diana for you... May you become a flower as beautiful as your heart was in this world."
				"Shoemaker":
					return "Forever with me, in my every step... Wherever you are now, may the angels appreciate you as much as I did, old friend..."
				"Sister" :
					return "Elapsam semel occasionem non ipse potest Iuppiter reprehendere. I hope you know what you're doing, nephew."
				_:
					return ArcherDialogs[deaths]
		"Armorer":
			if data.currentHero == "Shoemaker" :
				return "A good friend lost to darkness... I'll miss you, may you become our guiding light and shine upon our every act...."
			else :
				return ArmorerDialogs[deaths]
		"Granny":
			match data.currentHero :
				"Archer":
					return "When a child loses their parents, they are an orphan... When a mother loses her child, what should I be called? Pained and despaired is all that's coming to my mind..."
				"Sister":
					return "Was it not enough to have my grandson killed? Couldn't you take me instead!?Did you really have to drag your sister along with you, to the grave?"
				_:
					return GrannyDialogs[deaths]
		"Herbalist":
			if data.currentHero == "Shoemaker" :
				return "Hello my love, what do you... Wait... you are not... you... oh no... it can't... He can't... you can't... can't... can't......... no.............."
			elif data.Shoemaker == false :
				"Why... why not me... no... it must be some kind of nightmare... yes... that can't be... wake up... wake up.... please... let me... wake... up..."
			elif data.currentHero == "Sister" :
				return "Oh my! Hero, you.... I don't really know what to say... why her? She is... was... is she still?... such a nice girl... really clever, she would have become a great herbalist... Could you... give me a moment please? I need to... stay alone a bit..."
			else :
				return HerbalistDialogs[deaths]
		"Merchant":
			if data.currentHero == "Rogue" :
				return "Huh, you took over that criminal scum. I guess that's one less thing to worry about then."
			else :
				return MerchantDialogs[deaths]
		"Rogue":
			return RogueDialogs[deaths]
		"Shoemaker":
			if data.currentHero == "Herbalist" :
				return "My love, what pleasu... oh.... I see... until death... what a fool... I should have said forever... I should have..."
			elif data.Herbalist == false :
				return "Forever in my heart.... forever in my soul... forever... even death can't stop that... forever..."
			else :
				match data.currentHero:
					"Armorer" :
						return "It was you, friend... may the light be with you forever... You were the brightest star this town had seen..."
					"Archer" :
						return "Few knew you like I did... None saw how kind you were... Rest in peace, friend, I hope your new forest is blooming..."
					_:
						return ShoemakerDialogs[deaths]
		"Sister":
			match data.currentHero:
				"Granny":
					return "Hey grandma! How are you doing? Waiting for him to come back too? I'm so excited to see when he'll finally come home looking like himself and free all of our friends! Maybe you can prepare your tasty pie to celebrate that!"
				"Herbalist": 
					return "Hello Ma'am! I promise I won't miss our next lesson, promise! I was just really worried about my brother, but I know he'll be fine and we'll see him again really soon! I can't wait!"
				_:
					return SisterDialogs[deaths]
		"Smith":
			if data.currentHero == "Armorer":
				return "Dis a good plan Hero! Dat armor of his will help ye! No worry, I'll give ye the steel ye need! One man o' steel is enough for th'ole village!"
			else :
				return SmithDialogs[deaths]
	 
	return ""

