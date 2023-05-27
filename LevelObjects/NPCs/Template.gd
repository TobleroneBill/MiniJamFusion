extends Area2D

@onready var label = $Label
@onready var animplayer = $AnimationPlayer

@export var NPCTEXT: String = ''

# Called when the node enters the scene tree for the first tim`e.
func _ready():
	label.text = NPCTEXT
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		animplayer.play("FadeIn")
	


func _on_body_exited(body):
	if body.name == "Player":
		animplayer.play("FadeOut")
