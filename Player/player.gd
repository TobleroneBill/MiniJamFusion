extends RigidBody2D

@onready var raycast = $RemoteTransform2D/RayCast2D
@onready var endpos = $RemoteTransform2D/RayCast2D/Node2D
@onready var transformer = $RemoteTransform2D
@onready var SE = $Shot
@onready var HUD = $CanvasLayer
@onready var Score = $CanvasLayer/MainHud/Hud/Cleaned/ColorRect/Label2
@onready var IntroImage = $'CanvasLayer/MainHud/NewArea/AreaImg'
@onready var AnimPlayer = $'CanvasLayer/MainHud/NewArea/AreaImg'

@export var IntroTextTex: Texture
@export var DeathTex: Texture

@export var movespeed: int = 10000
@export var Recoil: int = -100
@export var RespawnPos: Vector2

var bullet = preload("res://Player/bullet.tscn")

func _ready():
	if IntroTextTex:
		IntroImage.texture = IntroTextTex

func _physics_process(_delta):
	CleansText()
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
	
	# Sets the level to use its own adjustment function that changes the level dynamically
	if Input.is_action_just_pressed("travel"):
		get_parent().TimeTravel()
	
	Globals.playerPos = global_position

func CleansText():
	$CanvasLayer/MainHud/Hud/Cleaned/ColorRect/Label2.text = str(Globals.cleans)
	$CanvasLayer/MainHud/Hud/Time.text = str(Globals.totaltime)

func playIntro():
	print('intro')
	$CanvasLayer/MainHud/NewArea.NewArea()
	Globals.addscore(1)
	$CanvasLayer/MainHud/Hud/Cleaned/ColorRect/Label2.text = str(Globals.cleans)

func Deathanim():
	$CanvasLayer/DeathScene/AudioStreamPlayer.play()
	$CanvasLayer/DeathScene/AnimationPlayer.play("Death")
	var lol = get_tree().get_root().get_child(1)
	var cam = Camera2D.new()
	lol.add_child(cam)
	$Camera2D.queue_free()
	cam.global_position = global_position
	cam.make_current()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Death":
		remove_child($Camera2D)
		Globals.FailLevel()

func WinAnim():
	$CanvasLayer/WinScreen/Win.play("Win")
	
func Past():
	$TravelPast.play()

func Present():
	$TravelPresent.play()
