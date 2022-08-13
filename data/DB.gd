extends Node

# This is the general database for all conferences/teams/players.

var conferences = [
	load("res://data/conference/AmericaEast.tres")
]

var randomPlayers = []


# Init
func _ready():
	# Generates roster players for all teams based on starting prestige
	for _conf in conferences:
		for _team in _conf.teams:
			# generate 1 goalie, 3 defense, 3 middies, 3 attack, 1 FOGO
			var newPlayers = []
			for i in range(0, 18):
				if i < 1:
					newPlayers.append(generate_roster_player(0, _team.prestige))
				elif i < 4:
					newPlayers.append(generate_roster_player(1, _team.prestige))
				elif i < 7:
					newPlayers.append(generate_roster_player(2, _team.prestige))
				elif i < 10:
					newPlayers.append(generate_roster_player(3, _team.prestige))
				elif i == 10:
					newPlayers.append(generate_roster_player(4, _team.prestige))
				else:
					newPlayers.append(generate_roster_player(int(rand_range(0,4)), _team.prestige))
			for _player in newPlayers:
				_team.players.append(_player)


# Helper functions
func get_all_teams():
	var output = []
	for conference in conferences:
		var teamsInConference = get_all_teams_from_conference(conference)
		for team in teamsInConference:
			output.append(team)
	return output

func get_all_teams_from_conference(conference):
	var output = []
	for _team in conference.teams:
		output.append(_team)
	return output

func get_team_conference(_team):
	for _conference in conferences:
		var teams = get_all_teams_from_conference(_conference)
		if _team in teams:
			return _conference

func get_player_team(_player: Player):
	var _teams = get_all_teams()
	for _team in _teams:
		if _player in _team.players:
			return _team

# Player generation
func generate_roster_player(_position: int, _ability: float):
	# Generates player attributes based on key stats for position vs ability.
	# Ability is determined by team prestige for the initial load, after that
	# prestige is only used in recruiting.
	
	var output: Player = Player.new()
	
	output.firstName = nameData.getRandomFirstName()
	output.lastName = nameData.getRandomLastName()
	output.year = int(rand_range(1,4))
	
	if _position == 4:
		output.dodging = rand_range(20, 60)
		output.shooting = rand_range(20, 60)
		output.passing = rand_range(20, 60)
		output.positioning = rand_range(20, 60)
		output.checking = rand_range(20, 60)
		output.groundballs = _ability + int(rand_range(-25,25))
		output.faceoff = _ability + int(rand_range(-25,25))
		output.goalie = rand_range(0, 10)
		output.position = 2
	
	# Goalie
	if _position == 0:
		output.dodging = rand_range(0, 30)
		output.shooting = rand_range(0, 30)
		output.passing = _ability + int(rand_range(-25,25))
		output.positioning = rand_range(0, 30)
		output.checking = rand_range(0, 30)
		output.groundballs = rand_range(0, 30)
		output.faceoff = rand_range(0, 30)
		output.goalie = _ability + int(rand_range(-25,25))
		output.position = 0
	
	# Defense
	elif _position == 1:
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
	elif _position == 2:
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
