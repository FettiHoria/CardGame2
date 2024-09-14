extends Node2D

var card_scene_path = "res://Collection/card_collection.tscn"

@onready var slot1 = $Slot1
@onready var slot2 = $Slot2
@onready var slot3 = $Slot3
@onready var slot4 = $Slot4


var collection_list = {}

func _ready():
	
	#print(CollectionDataRead.collection_data)
	#print(CollectionDataRead.allCards_data.size())
	
	print(CollectionDataRead.get_slots_data())
	
	var slot_cards = CollectionDataRead.get_slots_data()
	
	for slot_card in slot_cards.keys():
		print(slot_cards[slot_card][0]["name"])
	
	for slot_card in slot_cards:
		print(slot_card)
		var stats = CollectionDataRead.get_specific_data(slot_cards[slot_card][0]["name"], 1)
		if int(slot_card) == 1:
			slot1.setCard(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(slot_cards[slot_card][0]["name"]), CollectionDataRead.get_sprite_path(slot_cards[slot_card][0]["name"]))
		if int(slot_card) == 2:
			slot2.setCard(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(slot_cards[slot_card][0]["name"]), CollectionDataRead.get_sprite_path(slot_cards[slot_card][0]["name"]))
		if int(slot_card) == 3:
			slot3.setCard(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(slot_cards[slot_card][0]["name"]), CollectionDataRead.get_sprite_path(slot_cards[slot_card][0]["name"]))
		if int(slot_card) == 4:
			slot4.setCard(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(slot_cards[slot_card][0]["name"]), CollectionDataRead.get_sprite_path(slot_cards[slot_card][0]["name"]))
	
	var cards = CollectionDataRead.allCards_data
	var i = 1
	for card in cards:
		var stats = CollectionDataRead.get_specific_data(card, 1)
		var sprite_path = CollectionDataRead.get_sprite_path(card)
		collection_list[i] = load(card_scene_path).instantiate()
		add_child(collection_list[i])
		collection_list[i].card_assemble(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(card), str(sprite_path), i*170, 400)
		i += 1


func _on_home_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
