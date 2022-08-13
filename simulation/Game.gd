extends Node
class_name Game

# The teams that are playing
var homeTeam = null
var awayTeam = null

# Score variables
var homeTeamScore: int = 0
var awayTeamScore: int = 0

# Game time variables
var quarter: int = 1
var secondsRemaining: int = 900

# Player lists
var homePlayers: Dictionary = {0:[],1:[],2:[],3:[],4:[]}
var awayPlayers: Dictionary = {0:[],1:[],2:[],3:[],4:[]}
var homeBench: Array = []
var awayBench: Array = []


# Variables relating to play on the field
var isFaceoff: bool = true # Whether or not the next play has to be a faceoff
var playerInPossession = null # Which player has the ball
var teamInPossession = null # Which team has the ball

func _init(_homeTeam, _awayTeam):
	homeTeam = _homeTeam
	awayTeam = _awayTeam
	homePlayers = homeTeam.select_lineup()
	awayPlayers = awayTeam.select_lineup()
	homeBench = homePlayers[4]
	awayBench = awayPlayers[4]
	homePlayers.erase(4)
	awayPlayers.erase(4)


# Runs a play and adjusts game properly, returns a string saying what happened on that play
func run_play() -> String:
	randomize()
	
	# amount of time that the play takes off the clock in seconds
	var timeTaken = int(rand_range(0, 15))
	var announceString = ""
	
	if isFaceoff:
		isFaceoff = false
		var homeFogo = get_fogo(homePlayers[2])
		var awayFogo = get_fogo(awayPlayers[2])
		announceString += ("%s and %s will go head to head at the faceoff X...\n" % [homeFogo.lastName, awayFogo.lastName])
		# Run a stat versus of the two starting faceoff men
		# with a random chance to create a GB at midfield
		var faceOffCheck = check_faceoff(homeFogo, awayFogo)
		if faceOffCheck == null:
			announceString += ("Ball comes loose, ground ball at midfield!")
			return announceString
		else:
			announceString += ("%s takes the faceoff, %s ball." % [faceOffCheck.lastName, faceOffCheck.get_team().teamName])
			return announceString
	
	# If not a faceoff, check if any player is in possession.
		# If no player is in possession, check if any players are in the area
		# of the field that the ball is in.
	
	return announceString

# Versus functions
func check_faceoff(_player1, _player2):
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


# Helper functions
func get_fogo(_middieLine: Array):
	# Gets the player with the best faceoff stat from a midfield line (array)
	var fogo = null
	for _player in _middieLine:
		if fogo == null:
			fogo = _player
		else:
			if _player.faceoff > fogo.faceoff:
				fogo = _player
	return fogo
