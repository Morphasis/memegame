extends KinematicBody2D


func pop():
	if (!$AudioStreamPlayer2D.playing):
		$AudioStreamPlayer2D.play(0.130)


func _on_AudioStreamPlayer2D_finished():
	Global.game_data.points -= 100
	queue_free()
