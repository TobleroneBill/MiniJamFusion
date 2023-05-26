extends RigidBody2D

@onready var raycast = $RemoteTransform2D/RayCast2D
@onready var endpos = $RemoteTransform2D/RayCast2D/Node2D
@onready var transformer = $RemoteTransform2D
@onready var SE = $AudioStreamPlayer2D

@export var movespeed: int = 5000
@export var Recoil: int = -100

var bullet = preload("res://Player/bullet.tscn")


func _physics_process(delta):
	if Input.is_action_pressed("left"):
		apply_torque(-movespeed)
		
	if Input.is_action_pressed("right"):
		apply_torque(movespeed)
	
	if Input.is_action_just_pressed("Shoot"):
		
		
		var actualPos = Vector2(raycast.global_position.x - global_position.x,raycast.global_position.y - global_position.y)
		apply_impulse(-actualPos * Recoil,actualPos)
		
		var spawned = bullet.instantiate()
		spawned.position = endpos.global_position
		spawned.dir = actualPos.normalized()
		
		get_parent().add_child(spawned)
		SE.play()
		
		
		print('Shoots')
	
	# Sets the level to use its own adjustment function that changes the level dynamically
	if Input.is_action_just_pressed("travel"):
		get_parent().TimeTravel()
