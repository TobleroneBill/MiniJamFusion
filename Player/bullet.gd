extends Area2D

@export var speed: int = 10
@export var dir: Vector2 = Vector2(10,10)

func _physics_process(_delta):
	position += dir * speed

func _on_body_entered(body):
	if "circ" in body.get_meta_list():
		print('was enemy')
		if body.get_meta("circ"):
			Globals.cleans += (1 * Globals.roundNum)
			body.Deathanim()
	queue_free()
