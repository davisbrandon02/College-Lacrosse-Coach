extends Node

# This is the general database for all teams.

var conferences = [
	load("res://data/conference/AmericaEast.tres")
]

func initialize_database():
	pass

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
