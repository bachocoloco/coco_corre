extends Node2D

var screen_size : Vector2i

var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $player.position 


func _process(delta):
	if ($player.position.x - $Floor.position.x) > screen_size.x:
		$Floor.position.x = $Floor.position.x + screen_size.x
