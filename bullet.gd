extends KinematicBody2D


var projectile_speed = 750

var velocity = Vector2()

func _physics_process(delta):
	var collision = move_and_collide(Vector2(-1, 0) * projectile_speed * delta)

	if collision:
		if collision.collider.has_method("pop"): 
			collision.collider.pop()
			queue_free()
