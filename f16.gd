extends KinematicBody2D

export (int) var speed = 600
export (PackedScene) var Bullet

var body_color = "grey"
var tint_color = "grey"

export (bool) var movment_disabled = false;

var velocity = Vector2()

func get_input():
	if !movment_disabled:
		velocity = Vector2()
		if Input.is_action_pressed("right"):
			velocity.x += 1
		if Input.is_action_pressed("left"):
			velocity.x -= 1
		if Input.is_action_pressed("down"):
			velocity.y += 1
		if Input.is_action_pressed("up"):
			velocity.y -= 1
		velocity = velocity.normalized() * speed
		if Input.is_action_just_pressed("shoot"):
			shootBullet();

func shootBullet():
	var b = Bullet.instance()
	# Add the players movment to the bullet.
	get_tree().get_current_scene().add_child(b)
	b.position = self.get_position() - Vector2(100, 0)
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
