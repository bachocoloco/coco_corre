extends CanvasLayer

var score = 0
var high_score = 0
var is_mob_on_screen = false
var is_playing = false

func update_score_label():
	score = score+100
	$ScoreLabel.text = 'SCORE: %d'%(score)

func update_high_score_label():
	if score > high_score:
		high_score = score
		$HighScoreLabel.text = 'High Score: %d'%(high_score)

func _on_start_button_pressed():
	is_playing = true
	$ScoreTimer.start()
	$StartButton.visible = false


func _on_score_timer_timeout():
	update_score_label()
