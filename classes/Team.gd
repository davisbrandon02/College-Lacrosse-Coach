extends Resource
class_name Team

const MAX_PLAYERS = 20
const MIN_PLAYERS = 13

export var teamName: String = ""
export var prestige: int = -1
var players: Array = []

func add_player(_player: Player):
	players.append(_player)


# Lineup selection function
func select_lineup() -> Dictionary:
	var goalie_slots_remaining = 1
	var defense_slots_remaining = 3
	var mid_slots_remaining = 3
	var attack_slots_remaining = 3
	var lineup = {0:[],1:[],2:[],3:[],4:[]}
	
	var goalies = get_players_of_position(0)
	var defense = get_players_of_position(1)
	var mids = get_players_of_position(2)
	var attack = get_players_of_position(3)
	var fogos = get_players_of_position(4)
	
	while goalie_slots_remaining > 0:
		lineup[0].append(get_best_player(goalies))
		goalie_slots_remaining -= 1
	while defense_slots_remaining > 0:
		var playerToAdd = get_best_player(defense)
		lineup[1].append(playerToAdd)
		defense.erase(playerToAdd)
		defense_slots_remaining -=1
	while mid_slots_remaining > 0:
		var playerToAdd = get_best_player(mids)
		lineup[2].append(playerToAdd)
		mids.erase(playerToAdd)
		mid_slots_remaining -= 1
	while attack_slots_remaining > 0:
		var playerToAdd = get_best_player(attack)
		lineup[3].append(playerToAdd)
		attack.erase(playerToAdd)
		attack_slots_remaining -= 1
	
	return lineup


# Helper functions
func get_best_player(_players: Array):
	var bestPlayer = null
	for _player in _players:
		if bestPlayer == null or _player.get_overall() > bestPlayer.get_overall():
			bestPlayer = _player
	return bestPlayer

func get_players_of_position(_pos: int):
	var output:= []
	for _player in players:
		if _player.position == _pos:
			output.append(_player)
	return output

func get_fogo():
	var fogo = null
	for _player in players:
		if fogo == null:
			fogo = _player
		else:
			if _player.faceoff > fogo.faceoff:
				fogo = _player
	return fogo

func get_conference():
	return DB.get_team_conference(self)
