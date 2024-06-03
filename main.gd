extends Node2D
@export var mob_scene: PackedScene

var screen_size : Vector2i

var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $player.position 
	Ghud.start_game.connect(new_game)
	
func game_over():
	Ghud.update_high_score_label()

func new_game():
	print('empieza')
	$Floor.position.x = 0
	$player.position = PlayerInitialPosition
	$MOBTimer.start()

func _process(delta):
	$Floor.position.x = $player.position.x - 125


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.position.x = $player.position.x + 1500
	mob.position.y = 640
	add_child(mob)
	mob.hit.connect(game_over)
	$MOBTimer.wait_time = 2
