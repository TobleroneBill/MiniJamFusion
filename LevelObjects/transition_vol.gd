extends Node2D

@export var Level: PackedScene
@export var Respawn: bool = false
@export var respawnPos: Vector2
var player = preload("res://Player/player.tscn")

func _ready():
	pass

func _on_area_2d_body_entered(_body):
	# Doesnt work on own level, because Level will == null
	if Level and not Respawn:
		get_tree().change_scene_to_packed(Level)
	if Respawn:
		get_tree().reload_current_scene()
