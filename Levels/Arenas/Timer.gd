extends Timer

@export var TransitionPos: Vector2
var time = 0
var won = false

func WinScreen():
	Globals.MaxTime += 10
	Globals.combat = false
	$"../../../Player".WinAnim()
	$"../../../DeathBox".queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Regular time
	if Globals.combat:
		time += 1
		if time % 60 == 0:
			Globals.time += 1
			Globals.totaltime += 1
			time = 0
	
	# Round Win
	if Globals.time == Globals.MaxTime:
		WinScreen()
		won = true
	
	
	if won:
		if $"../../../Player".position.y > TransitionPos.y:
			Globals.SwitchLevel()
