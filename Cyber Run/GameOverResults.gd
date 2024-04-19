extends Node

var hiscore: Label
var score: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	hiscore = $hiscore
	score = $"end-score"
	
	score.text = "Score: %dm" % Globals.lastScore
	if (PlayerPrefs.get_pref("highscore", 0) < Globals.lastScore):
		PlayerPrefs.set_pref("highscore", Globals.lastScore)
	hiscore.text = "Hi-Score: %dm" % PlayerPrefs.get_pref("highscore", 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
