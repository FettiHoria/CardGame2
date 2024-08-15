extends Node

var allCards_data = {}
var collection_data = {}

func load_json_data(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json_data = file.get_as_text()
		file.close()
		return JSON.parse_string(json_data)
	else:
		print("Failed to open file: ", file_path)


#ChatGPT made the function for a hardcoded card name, I just added a new parameter "cardName" and made the function to search in specific_data for that transmited name
#2ez
func get_specific_data_test(cardName:String, iterator: int) -> void:
	#load_json_data("res://Data/all_cards_data.json")
	if allCards_data.has(cardName):
		for item in allCards_data[cardName]:
			if item["id"] == str(iterator):
				var name = item["name"]
				var image = item["image"]
				var stats = item["stats"][str(iterator)]
				
				print("Name: ", name)
				print("Image: ", image)
				print("XP Min: ", stats["xp_min"])
				print("XP Max: ", stats["xp_max"])
				print("Attack: ", stats["attack"])
				print("Health: ", stats["health"])


func get_specific_data(cardName:String, iterator: int):
	load_json_data("res://Data/all_cards_data.json")
	if allCards_data.has(cardName):
		for item in allCards_data[cardName]:
			#if item["stats"] == str(iterator):
			#print("item id: " + str(item["stats"][str(iterator)]))
			var name = item["name"]
			var image = item["image"]
			var stats = item["stats"][str(iterator)]
			return stats

func get_sprite_path(cardName: String):
	load_json_data("res://Data/all_cards_data.json")
	if allCards_data.has(cardName):
		for item in allCards_data[cardName]:
			return item["image"]


func get_stats_by_xp(cardName:String, xp: int):
	load_json_data("res://Data/all_cards_data.json")
	if allCards_data.has(cardName):
		for item in allCards_data[cardName]:
			for i in range(1, item["stats"].size()+1):
				if(int(item["stats"][str(i)]["xp_min"]) < xp and int(item["stats"][str(i)]["xp_max"] > xp)):
					return int(i)


# Funcția pentru salvarea datelor în fișierul JSON
func save_updates_card_collection(file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_data = JSON.stringify(collection_data)  # Convertim dicționarul în string JSON
		file.store_string(json_data)
		file.close()
	else:
		print("Failed to open file for saving: ", file_path)


# Funcția pentru actualizarea stats-urilor
func set_card_slot(cardName: String, slot: String) -> void:
	#if collection_data.has(cardName):
	#print(collection_data[slot])
	for param in collection_data[slot]:
		param["name"] = cardName
	#print(collection_data[slot])


func _ready() -> void:
	#get_specific_data(card_name, level);
	#print(get_stats_by_xp("Circle", 32))
	
	#var hhh = get_specific_data("Square", 2)
	#print(hhh["xp_min"])
	
	#print(get_specific_data("Square", 2))
	allCards_data = load_json_data("res://Data/all_cards_data.json")
	collection_data = load_json_data("res://Data/collection1.json")
	
	#set_card_slot("Circle", "1")
	#save_updates_card_collection("res://Data/collection1.json")
	
	
