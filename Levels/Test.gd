extends Node

var present = true

func TimeTravel():
	print("timetravel")
	# switch to past
	
	
	# this should probably go in some function	
	if present:
		for node in $Present.get_children():
			for child in node.get_children():
				if child.name == "CollisionShape2D":
					print('disabled: ' + child.name)
					child.disabled = true
					
			node.visible = false
			
		for node in $Past.get_children():
			for child in node.get_children():
				if child.name == "CollisionShape2D":
					print('enabled: ' + child.name)
					child.disabled = false
			node.visible = true
	else:
		for node in $Past.get_children():
			node.visible = false
			for child in node.get_children():
				if child.name == "CollisionShape2D":
					print('disabled: ' + child.name)
					child.disabled = true
			
		for node in $Present.get_children():
			for child in node.get_children():
				if child.name == "CollisionShape2D":
					print('enabled: ' + child.name)
					child.disabled = false
			node.visible = true
			
	present = !present
		
		

func _ready():
	TimeTravel()


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


