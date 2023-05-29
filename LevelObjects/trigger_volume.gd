extends Area2D

func _on_body_entered(body):
	#print(body.name)
	if body.get_meta("circ"):
		body.Deathanim()
	if body.name == "Player":
		body.Deathanim()
