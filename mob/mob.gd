extends Area2D

signal hit


func _ready():
	Ghud.mob_counter = Ghud.mob_counter + 3
	var collisions = [
		$collisionA,
		$Collisionabeja,
		$CollisionCactus,
		$CollisionGato
	]
	var sprites= [
		$spriteA, 
		$abejasprite, 
		$cactus,
		$gato
	]
	
	var random_int = randi() % collisions.size()
	var selected_collision = collisions [random_int]
	var selected_sprite = sprites[random_int]
	selected_collision.disabled = false
	selected_collision.visible = true
	selected_sprite.visible = true  

func _on_visible_on_screen_notifier_2d_screen_exited():
	$gato.play("parpadear")
	$CollisionGato. disabled = true
	if Ghud.mob_counter > 0:
		Ghud.mob_counter = Ghud.mob_counter - 3
		
	queue_free()
	
	

func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
		print("game over")
		hit.emit()
