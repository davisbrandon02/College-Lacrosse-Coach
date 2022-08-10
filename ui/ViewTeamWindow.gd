extends Control

var selectedTeam

func _ready():
	selectedTeam = career.coachTeam
	updateTeamList()
	updatePlayerList(selectedTeam)
	print($ScrollContainer/Control/StartersContainer.get_children())

func updateTeamList():
	for conference in DB.conferences:
		

func _on_TeamSelect_item_selected(index):
	selectedTeam = teamData.allTeams[index]
	updatePlayerList(selectedTeam)

var pb = preload("res://ui/buttons/PlayerButton.tscn")
func updatePlayerList(team):
	for child in $ScrollContainer/Control/StartersContainer.get_children():
		child.queue_free()
	
	for player in team['teamPlayers'][0]:
		var pbi = pb.instance()
		pbi.player = player
		$ScrollContainer/Control/StartersContainer.add_child(pbi)
	
	for player in team['teamPlayers'][1]:
		var pbi = pb.instance()
		pbi.player = player
		$ScrollContainer/Control/StartersContainer.add_child(pbi)
	
	for player in team['teamPlayers'][2]:
		var pbi = pb.instance()
		pbi.player = player
		$ScrollContainer/Control/StartersContainer.add_child(pbi)
	
	for player in team['teamPlayers'][3]:
		var pbi = pb.instance()
		pbi.player = player
		$ScrollContainer/Control/StartersContainer.add_child(pbi)

