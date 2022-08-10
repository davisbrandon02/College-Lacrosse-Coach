extends Control

onready var game
var count = 0

func _ready():
	game = Game.new(DB.conferences[0].teams[0], DB.conferences[0].teams[1])

func _process(delta):
	$GameScore/HomeTeamLabel.text = game.homeTeam.teamName
	$GameScore/AwayTeamLabel.text = game.awayTeam.teamName


func _on_NextPlayDebugButton_pressed():
	DB.randomPlayers.append(DB.generate_random_player())
	print(DB.randomPlayers[count].get_overall())
	count += 1
