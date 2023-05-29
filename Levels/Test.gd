extends Node

var present = true

#/__________________/OBSTACLES MUST BE 1 LAYER DEEP WITH STATICBODY2D NODES/__________________/

@onready var player = $Player

func EnableCollision(node):
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
	

func TimeTravel(start=false):
	# this should probably go in some function	
	if not present:
		player.Past()
		for node in $Present.get_children():
			DisableCollision(node)
		for node in $Past.get_children():
			EnableCollision(node)
	else:
		if not start:
			player.Present()
		for node in $Present.get_children():
			EnableCollision(node)
		for node in $Past.get_children():
			DisableCollision(node)
			
	present = !present

func _ready():
	# Hide all 
	TimeTravel(true)

func _on_respawn_trigger_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
