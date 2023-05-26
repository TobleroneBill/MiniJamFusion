extends Node

var present = true

func TimeTravel():
	print("timetravel")
	# switch to past
	
	if present:
		for node in $Present.get_children():
			node.add_collision_exception_with($Player)
			node.visible = false
			
		for node in $Past.get_children():
			node.remove_collision_exception_with($Player)
			node.visible = true
		present = !present
	
	else:
		for node in $Past.get_children():
			node.visible = false
			node.add_collision_exception_with($Player)
			
		for node in $Present.get_children():
			node.remove_collision_exception_with($Player)
			node.visible = true
			
		present = !present
		
		

func _ready():
	TimeTravel()

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


