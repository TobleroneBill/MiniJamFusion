extends Area2D

@export var speed: int = 10
@export var dir: Vector2 = Vector2(10,10)



func _physics_process(delta):
	position += dir * speed
	pass

func _on_body_entered(body):
	queue_free()
