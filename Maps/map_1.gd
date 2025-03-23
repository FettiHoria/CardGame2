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

@onready var turn_button = $Turn_Button

var curr_state_list = ["START", "PLAYER_TURN", "ENEMY_TURN", "END"]
var curr_state = 0


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
	curr_state = 1

func _process(delta):
	if curr_state == 2:
		turn_button.disabled = false
		#turn_button.visible = true
		turn_button.text = "End Turn"



func _on_turn_button_button_up() -> void:
	if (curr_state == 1):
		Fight()
		turn_button.disabled = true
		#turn_button.visible = false
		turn_button.text = "Enemy turn"
		curr_state = 2
	#elif(curr_state == 2):
		#turn_button.disabled = false
		#turn_button.text = "End Turn"
		#curr_state = 1

func Fight():
	print('start fight')
	
	#print(eslot1.getAttack())
	if is_instance_valid(eslot1) &&  is_instance_valid(slot1):
		eslot1.takeDamage(slot1.getAttack())
	if is_instance_valid(eslot2) &&  is_instance_valid(slot2):
		eslot2.takeDamage(slot2.getAttack())
	if is_instance_valid(eslot3) &&  is_instance_valid(slot3):
		eslot3.takeDamage(slot3.getAttack())
	if is_instance_valid(eslot4) &&  is_instance_valid(slot4):
		eslot4.takeDamage(slot4.getAttack())
	
	if is_instance_valid(eslot1) &&  is_instance_valid(slot1):
		slot1.takeDamage(eslot1.getAttack())
	if is_instance_valid(eslot2) &&  is_instance_valid(slot2):
		slot2.takeDamage(eslot2.getAttack())
	if is_instance_valid(eslot3) &&  is_instance_valid(slot3):
		slot3.takeDamage(eslot3.getAttack())
	if is_instance_valid(eslot4) &&  is_instance_valid(slot4):
		slot4.takeDamage(eslot4.getAttack())
	
	await get_tree().create_timer(1.0).timeout
	
	print('fight over')
	curr_state = 1
