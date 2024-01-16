extends Label

var score = 0

func _ready():
	pass

func _process(delta):
	if fmod(delta, 60) == 0:
		score += 1
		
	text = str(score)
