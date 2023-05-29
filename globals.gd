extends Node

#Holds all variables and flags that the player effects
@export var levelArr: Array[PackedScene]


var lv1 = preload("res://Levels/Arenas/ARENA1.tscn")
var lv2 = preload("res://Levels/Arenas/ARENA2.tscn")
var lv3 = preload("res://Levels/Arenas/ARENA3.tscn")
var currentscene = lv1

var defMaxTime = 20 # Max time to reset to if failure

var time = 0		# Actual level time
var totaltime = 0	# Total time player endured
var MaxTime = 20		# Time until level ends

var cleans = 0			# 100 cleans = win, this is done by destroying crap and doing quests
var roundNum = 0		# +1 every timer tick
var levelNum = 0

var playerPos = Vector2(0,0)
var combat = false
var levelCompleted = false
var cleansMultiplier = 20		# mod 20 == 0 for combat to end
var resettimer = 10	# Enemy respawn time

func addscore(num):
	cleans += num

func LevelReset():
	cleans = 0
	roundNum = 0
	time = 0
	combat = false

func SwitchLevel():
	roundNum+=1		# Used by player to add to score
	LevelReset()
	
	if levelNum == 0:
		levelNum+=1
		get_tree().change_scene_to_packed(lv2)
		return
	if levelNum == 1:
		levelNum+=1
		get_tree().change_scene_to_packed(lv3)
		return
	if levelNum == 2:
		levelNum = 0
		get_tree().change_scene_to_packed(lv1)
		return

# Failed
func FailLevel():
	totaltime = 0
	MaxTime = defMaxTime
	LevelReset()
	currentscene = lv1
	get_tree().change_scene_to_packed(currentscene)
