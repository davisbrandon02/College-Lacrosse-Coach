extends Control

onready var game

func _ready():
	game = Game.new(DB.conferences[0].teams[0])

func _process(delta):
	$GameScore/HomeTeamLabel.text = game.homeTeam.teamName
	$GameScore/AwayTeamLabel.text = game.awayTeam.teamName


func _on_NextPlayDebugButton_pressed():
	pass # Replace with function body.
