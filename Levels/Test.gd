extends Node


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()