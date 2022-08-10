extends Node
class_name Game

var homeTeam: Team = null
var awayTeam: Team = null

var homeTeamScore: int = 0
var awayTeamScore: int = 0

var quarter: int = 1
var secondsRemaining: int = 900

func _init(_homeTeam, _awayTeam):
	homeTeam = _homeTeam
	awayTeam = _awayTeam
