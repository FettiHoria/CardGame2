extends Node

var curr_state_list = ["START", "PLAYER_TURN", "ENEMY_TURN", "END"]
var curr_state = 0


func _ready() -> void:
	print(curr_state_list[curr_state])
	print("merge baaaaa")
