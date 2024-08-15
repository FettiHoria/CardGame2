extends Node2D

var card_scene_path = "res://Scenes/card_collection.tscn"


var collection_list = {}

func _ready():
	
	#print(CollectionDataRead.collection_data)
	print(CollectionDataRead.allCards_data.size())
	
	var cards = CollectionDataRead.allCards_data
	var i = 1
	for card in cards:
		var stats = CollectionDataRead.get_specific_data(card, 1)
		var sprite_path = CollectionDataRead.get_sprite_path(card)
		collection_list[i] = load(card_scene_path).instantiate()
		add_child(collection_list[i])
		collection_list[i].card_assemble(str(stats["attack"]), str(stats["health"]), str(stats["xp_max"]), str(card), str(sprite_path), i*200, 200)
		i += 1
