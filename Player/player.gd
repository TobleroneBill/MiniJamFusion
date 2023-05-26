extends RigidBody2D

@onready var raycast = $RemoteTransform2D/RayCast2D
@onready var transformer = $RemoteTransform2D


@export var movespeed: int = 5000
@export var Recoil: int = -100


func _physics_process(delta):
	#raycast.draw_dashed_line(raycast.position,raycast.target_position,Color(255,255,255),5)
	#raycast.draw_line(raycast.position,raycast.target_position,Color(255,255,255),5)
	if Input.is_action_pressed("left"):
		apply_torque(-movespeed)
		
	if Input.is_action_pressed("right"):
		apply_torque(movespeed)
	
	if Input.is_action_just_pressed("Shoot"):
		print('RaycastPos: ' + str(raycast.global_position))
		print('globalPos: ' + str(global_position))
		var actualPos = Vector2(raycast.global_position.x - global_position.x,raycast.global_position.y - global_position.y)
		print(global_position + actualPos)
		
		
		
		#apply_impulse(Vector2(actualPos.x*Recoilx,actualPos.y*Recoily),actualPos)
		apply_impulse(-actualPos * Recoil,actualPos)
		print('Shoots')
