extends Button

var player

func _ready():
	if player != null:
		match player.position:
			-1:
				$PositionLabel.text = 'INV'
			0:
				$PositionLabel.text = 'G'
			1:
				$PositionLabel.text = 'D'
			2:
				$PositionLabel.text = 'M'
			3:
				$PositionLabel.text = 'A'
		
		$NameLabel.text = player.firstName[0] + '. ' + player.lastName
		
		$AbilityLabel.text = str(player.curAbility)
