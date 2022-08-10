extends Node

var firstNames = [
	'Rich'
	,'Chad'
	,'Brad'
	,'Peter'
	,'Tyler'
	,'Henry'
]

var lastNames = [
	'Smith'
	,'Tennenbaum'
	,'Erving'
	,'Evans'
	,'Henry'
]

func getRandomFirstName():
	randomize()
	firstNames.shuffle()
	return firstNames[0]

func getRandomLastName():
	randomize()
	lastNames.shuffle()
	return lastNames[0]
