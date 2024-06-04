extends Area2D

signal hit


func _ready():
	Ghud.mob_counter = Ghud.mob_counter + 1
	var collisions = [
		$collisionA
	]
	var sprites= [
		$spriteA
	]
	
	var random_int = randi() % collisions.size()
	var selected_collision = collisions [random_int]
	var selected_sprite = sprites[random_int]
	selected_collision.disabled = false
	selected_collision.visible = true
	selected_sprite.visible = true  

func _on_visible_on_screen_notifier_2d_screen_exited():
	if Ghud.mob_counter > 0:
		Ghud.mob_counter = Ghud.mob_counter - 1
	queue_free()
	
	

func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
		print("game over")
		hit.emit()
