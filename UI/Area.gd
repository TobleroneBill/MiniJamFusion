extends Control

@onready var Anim = $AnimationPlayer
@onready var Audio = $AudioStreamPlayer


func NewArea():
	Audio.play()
	Anim.play("Area Anim")
