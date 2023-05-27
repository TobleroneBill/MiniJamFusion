extends Area2D

@export var speed: int = 10
@export var dir: Vector2 = Vector2(10,10)



func _physics_process(_delta):
	position += dir * speed

func _on_body_entered(_body):
	queue_free()
