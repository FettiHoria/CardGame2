extends Node2D

var card_scene_path = "res://Scenes/card_collection.tscn"

func _ready():
	var card1 = load(card_scene_path).instantiate()
	add_child(card1)
	card1.card_assemble(str("1"), str("1"), str("1"), str("circle"), str("res://images/circle.png"))
	card1.setname()
