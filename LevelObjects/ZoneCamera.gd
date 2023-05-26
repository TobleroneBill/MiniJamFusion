extends Camera2D


@onready var playerNode = null
# sets to active if player is inside the viewport zone

func _ready():
	for child in get_parent().get_parent().get_children():
		if child.name == "player":
			playerNode = child
	


func _on_area_2d_body_entered(body):
	make_current()
