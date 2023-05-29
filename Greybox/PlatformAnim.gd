extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Movement.play("Move")

func _on_movement_animation_finished(anim_name):
	$Movement.play("Move")
