extends Node

# This is the general database for all teams.

var conferences = [
	load("res://data/conference/AmericaEast.tres")
]

var randomPlayers = []

func initialize_database():
	pass


# Helper functions
func get_all_teams():
	var output = []
	for conference in conferences:
		get_all_teams_from_conference(conference)
	return output

func get_all_teams_from_conference(conference):
	var output = []
	for team in conference:
		output.append(team)
	return output


# Player generation
func generate_roster_player(_position: int, _ability: float):
	pass

# Creates a 'newgen'
func generate_random_player():
	var output: Player = Player.new()
	
	output.firstName = nameData.getRandomFirstName()
	output.lastName = nameData.getRandomLastName()
	output.year = 0
	
	# about a quarter of all newgens will be goalies or FOGOs
	var posCheck = int(rand_range(1,12))
	
	# FOGO
	if posCheck <= 1:
		output.dodging = rand_range(20, 60)
		output.shooting = rand_range(20, 60)
		output.passing = rand_range(20, 60)
		output.positioning = rand_range(20, 60)
		output.checking = rand_range(20, 60)
		output.groundballs = rand_range(30, 80)
		output.faceoff = rand_range(30, 80)
		output.goalie = rand_range(0, 10)
		output.position = 2
	
	# Goalie
	if posCheck <= 3:
		output.dodging = rand_range(0, 30)
		output.shooting = rand_range(0, 30)
		output.passing = rand_range(30, 80)
		output.positioning = rand_range(0, 30)
		output.checking = rand_range(0, 30)
		output.groundballs = rand_range(0, 30)
		output.faceoff = rand_range(0, 30)
		output.goalie = rand_range(30, 80)
		output.position = 0
	
	# Defense
	if posCheck <= 6:
		output.dodging = rand_range(15, 50)
		output.shooting = rand_range(10, 40)
		output.passing = rand_range(25, 70)
		output.positioning = rand_range(30, 80)
		output.checking = rand_range(30, 80)
		output.groundballs = rand_range(30, 80)
		output.faceoff = rand_range(0, 20)
		output.goalie = rand_range(0, 10)
		output.position = 1
	
	# Middie
	if posCheck <= 9:
		output.dodging = rand_range(20, 70)
		output.shooting = rand_range(20, 70)
		output.passing = rand_range(30, 80)
		output.positioning = rand_range(20, 70)
		output.checking = rand_range(20, 50)
		output.groundballs = rand_range(20, 70)
		output.faceoff = rand_range(0, 20)
		output.goalie = rand_range(0, 10)
		output.position = 2
	
	# Attack
	else:
		output.dodging = rand_range(30, 80)
		output.shooting = rand_range(30, 80)
		output.passing = rand_range(20, 70)
		output.positioning = rand_range(10, 30)
		output.checking = rand_range(20, 40)
		output.groundballs = rand_range(20, 40)
		output.faceoff = rand_range(30, 80)
		output.goalie = rand_range(0, 10)
		output.position = 3
	
	return output
