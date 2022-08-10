extends Object
class_name Player

const MAX_ABILITY = 99

# General info
var firstName : String = ""
var lastName : String = ""
var year : int = -1
var position: int = -1 # (Goalie : 0, Defense : 1, Midfield : 2, Attack : 3)
var curAbility: float = -1
var potAbility: float = -1

# Stats
var dodging: int = -1
var shooting: int = -1
var passing: int = -1
var positioning: int = -1
var checking: int = -1
var faceoff: int = -1
var goalie: int = -1
