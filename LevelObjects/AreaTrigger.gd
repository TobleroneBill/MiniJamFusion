extends Node2D



func _on_body_entered(body):
	print('killing self')
	queue_free()
