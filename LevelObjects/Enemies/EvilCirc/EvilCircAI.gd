extends RigidBody2D

@export var movespeed: int = 10000
@export var Recoil: int = -15

var bullet = preload("res://Player/bullet.tscn")
var playerDist = Vector2(0,0)
var grounded = false

# If player on left side, move left, else right
func movement():
	playerDist = Vector2(global_position.x - Globals.playerPos.x,global_position.y - Globals.playerPos.y)
	
	if playerDist < Vector2.ZERO:
		apply_torque(movespeed)
	elif playerDist > Vector2.ZERO:
		apply_torque(-movespeed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	movement()

func Deathanim():
	freeze = true
	$AnimationPlayer.play("Death")
	
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print('hit player')
		body.apply_impulse(playerDist * Recoil,playerDist)
	else:
		if body.global_position > global_position:
			grounded = true

func _on_area_2d_body_exited(body):
	if body.global_position > global_position:
		grounded = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Death":
		queue_free()
