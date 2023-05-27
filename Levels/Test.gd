extends Node

var present = true

#/__________________/OBSTACLES MUST BE 1 LAYER DEEP WITH STATICBODY2D NODES/__________________/

func EnableCollision(node):
	print('enabled: ' + node.name)
	if node is Node2D:
		var children = node.get_children()
		for child in children:
			if child is AnimationPlayer:
				if child.name == "Fade":
					child.play("IN")
			if child is StaticBody2D:
				child.collision_layer = 1
	if node is StaticBody2D:
		node.collision_layer = 1

	node.visible = true

func DisableCollision(node):
	print('disabled: ' + node.name)
	if node is Node2D:
		var children = node.get_children()
		for child in children:
			if child is AnimationPlayer:
				if child.name == "Fade":
					child.play("OUT")
			if child is StaticBody2D:
				child.collision_layer = 0
	if node is StaticBody2D:
		node.collision_layer = 0
	node.visible = false
	

func TimeTravel():
	print("timetravel")
	# switch to past
	
	
	# this should probably go in some function	
	if not present:
		for node in $Present.get_children():
			DisableCollision(node)
		for node in $Past.get_children():
			EnableCollision(node)
	else:
		for node in $Present.get_children():
			EnableCollision(node)
		for node in $Past.get_children():
			DisableCollision(node)
			
	present = !present

func _ready():
	
	# Hide all 
	TimeTravel()
	pass


func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()





