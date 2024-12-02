extends CharacterBody2D

# Check for collision with an Area2D during physics processing
func _physics_process(delta):
	for contact in get_slide_collision_count():
		var collision = get_slide_collision(contact)
		if collision.collider is Area2D:
			var area = collision.collider
			if area.is_in_group("some_group_name"):  # Optional
				var new_scene = load("res://walka.tscn")
				if new_scene is PackedScene:
					get_tree().change_scene_to(new_scene)
				else:
					print("Error: Loaded resource is not a PackedScene.")
