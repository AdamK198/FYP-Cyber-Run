extends Control

var score = 0
var score_fl = 0.0
var dead = false
@onready var scorelabel = $score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	if (!dead):
		score_fl += 0.2
		score = score_fl
		Globals.currentScore = score
		scorelabel.text = "Score: %dm" % score
	
