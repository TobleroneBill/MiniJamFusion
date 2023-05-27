extends Area2D

@onready var label = $ColorRect/Label
@onready var animplayer = $AnimationPlayer


@export var NPCTEXT: String = ''
@export var TEXTURE: CompressedTexture2D

# Called when the node enters the scene tree for the first tim`e.
func _ready():
	label.text = NPCTEXT
	$Sprite2D.texture = TEXTURE
	pass # Replace with function body.



func _on_body_entered(body):
	if body.name == "Player":
		animplayer.play("FadeIn")
	


func _on_body_exited(body):
	if body.name == "Player":
		animplayer.play("FadeOut")
