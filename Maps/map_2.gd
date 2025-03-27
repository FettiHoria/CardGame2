extends Node2D

var team_script = load("res://Maps/LoadPack.gd")
var enemy_script = load("res://Maps/LoadEnemies.gd")
var battle_script = load("res://Maps/BattleMechanics.gd")

var plm
var enemy_data
var enemy_load


func _ready() -> void:
	for enemy in enemy_data:
		enemy_load = load("res://Maps/card_combat.tscn").instantiate()
		print("Spawn enemy:", enemy['attack'])
		enemy_load.setStats(enemy['attack'], enemy['health'], enemy['level'], enemy['name'], enemy['img'], int(enemy['pos_x']), int(enemy['pos_y']))
		add_child(enemy_load)
		
		
