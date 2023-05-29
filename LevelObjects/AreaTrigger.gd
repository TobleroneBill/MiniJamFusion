extends Node2D

func _on_body_entered(body):
	print('killing self')
	body.playIntro()
	Globals.combat = true
	queue_free()
	$"../StaticLevel/Slide".queue_free()
