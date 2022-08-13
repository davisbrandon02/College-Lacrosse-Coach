extends Control

onready var game
var count = 0

func _ready():
	var teams = DB.conferences[0].teams
	game = Game.new(teams[randi() % teams.size()], teams[randi() % teams.size()])

func _process(delta):
	$GameScore/HomeTeamLabel.text = game.homeTeam.teamName
	$GameScore/AwayTeamLabel.text = game.awayTeam.teamName

func _on_NextPlayDebugButton_pressed():
	var announceString = game.run_play()
	print(announceString)
