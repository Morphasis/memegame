extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Score.text != str(Global.game_data.points):
		$Score.text = str(Global.game_data.points)
