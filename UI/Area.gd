extends Control

@onready var Anim = $AnimationPlayer
@onready var Audio = $AudioStreamPlayer


func NewArea():
	Audio.play()
	Anim.play("Area Anim")

# Called when the node enters the scene tree for the first time.
func _ready():
	#NewArea()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		NewArea()

