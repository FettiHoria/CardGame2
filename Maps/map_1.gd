extends Node2D

var team_script = load("res://Maps/LoadPack.gd")
var enemy_script = load("res://Maps/LoadEnemies.gd")
var battle_script = load("res://Maps/BattleMechanics.gd")

@onready var slot1 = $Slot1
@onready var slot2 = $Slot2
@onready var slot3 = $Slot3
@onready var slot4 = $Slot4

@onready var eslot1 = $Eslot1
@onready var eslot2 = $Eslot2
@onready var eslot3 = $Eslot3
@onready var eslot4 = $Eslot4


func _ready() -> void:
	var new_node = Node.new()
	#var new_script = load("res://cale_catre_script/script_aditional.gd")
	new_node.set_script(team_script)
	add_child(new_node)
	print(new_node)
	new_node.say()
	new_node.load(slot1, slot2, slot3, slot4)
	
	var enemy_node = Node.new()
	enemy_node.set_script(enemy_script)
	add_child(enemy_node)
	enemy_node.load(eslot1, eslot2, eslot3, eslot4)
	
	var battle_node = Node.new()
	battle_node.set_script(battle_script)
	add_child(battle_node)
	
