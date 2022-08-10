extends Node
class_name Game

var homeTeam: Team = null
var awayTeam: Team = null

var homeTeamScore: int = 0
var awayTeamScore: int = 0

var quarter: int = 1
var secondsRemaining: int = 900

var playerInPossession = null

# Variables relating to play on the field
var isFaceoff: bool = true # Whether or not the next play has to be a faceoff

func _init(_homeTeam, _awayTeam):
	homeTeam = _homeTeam
	awayTeam = _awayTeam

# Runs a play and adjusts game properly, returns a string saying what happened on that play
func runPlay() -> String:
	
	# amount of time that the play takes off the clock
	var timeTaken = int(rand_range(0, 15))
	var announceString = ""
	
	if isFaceoff:
		announceString += "%s and %s will go head to head at the faceoff X."
		# Run a stat versus of the two starting faceoff men
		# with a random chance to create a GB at midfield
	
	# If not a faceoff, check if any player is in possession.
		# If no player is in possession, check if any players are in the area
		# of the field that the ball is in.
	
	print(announceString)
	return announceString

# Versus functions
func checkFaceoff(_player1, _player2):
	# random chance to create a GB play
	var groundBallChance = int(rand_range(0, 50))
	var totals = _player1.faceoff + _player2.faceoff + groundBallChance
	var rand_number = rand_range(0, totals)
	
	if rand_number < groundBallChance:
		# ground ball
		return null
	
	if rand_number < groundBallChance + _player1.faceoff:
		# player 1's ball
		return _player1
	
	else:
		#player 2's ball
		return _player2
