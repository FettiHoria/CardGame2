extends Node


var card_scene_path = "res://Collection/card_collection.tscn"


var collection_list = {}

func say():
	print("gyjdcyhkdghxhgfjg")

func load(slot1, slot2, slot3, slot4):
	print("fuckkk")
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
	
