extends Node2D

@export var Spawnpos: Vector2 = Vector2(0,0)
@export var SpawnChance: Vector2 = Vector2(0,0)
@export var timerRef: Timer
var rtimer = Timer
var respawnTime = Globals.resettimer
var evilCirc = preload("res://LevelObjects/Enemies/EvilCirc/EvilCirc.tscn")

func _ready():
	Spawnpos = position

func SpawnCirc():
	var currentcirc = evilCirc.instantiate()
	currentcirc.position = position
	get_tree().get_current_scene().add_child(currentcirc)

# Called from trigger volume
func startTimer():
	timerRef.start(respawnTime)

func _on_timer_timeout():
	if Globals.combat:
		timerRef.start(respawnTime)
		SpawnCirc()

func _on_intro_text_body_entered(body):
	if body.name == "Player":
		startTimer()
