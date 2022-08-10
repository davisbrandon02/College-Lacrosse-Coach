extends Object
class_name Player

# General info
var firstName : String = ""
var lastName : String = ""
var year : int = -1
var position: int = -1 # (Goalie : 0, Defense : 1, Midfield : 2, Attack : 3)
var potential: int = -1

# Stats
var dodging: int = -1
var shooting: int = -1
var passing: int = -1
var positioning: int = -1
var checking: int = -1
var groundballs: int = -1
var faceoff: int = -1
var goalie: int = -1

# Functions to get the overall of the player
func get_overall() -> int:
	var output: float
	
	match position:
		0:
			output = get_average([goalie, passing])
		1:
			output = get_average([positioning, checking, groundballs])
		2:
			output = get_average([dodging, shooting, passing, groundballs])
		3:
			output = get_average([dodging, shooting, passing])
	
	return int(output)

func get_average(_array: Array):
	var sum: float = 0
	var count: int = 0
	
	for i in _array:
		sum += i
		count += 1
	
	return sum / count
