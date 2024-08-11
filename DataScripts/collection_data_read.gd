extends Node

var specific_data = {}

func load_json_data(file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json_data = file.get_as_text()
		#Edit de la dev pt dev: functia asta .parse_string nu o stie chatgpt bine, dunno why, dar tot el o repara
		#Pune .result dupa ia sau te miri ce, posibil asa era in versiunile vechi de godot, eu folosec v4
		specific_data = JSON.parse_string(json_data)  # Direct din JSON în Dictionary 
		file.close()
	else:
		print("Failed to open file: ", file_path)


#ChatGPT made the function for a hardcoded card name, I just added a new parameter "cardName" and made the function to search in specific_data for that transmited name
#2ez
func get_specific_data_test(cardName:String, iterator: int) -> void:
	load_json_data("res://Data/all_cards_data.json")
	if specific_data.has(cardName):
		for item in specific_data[cardName]:
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
	if specific_data.has(cardName):
		for item in specific_data[cardName]:
			if item["id"] == str(iterator):
				var name = item["name"]
				var image = item["image"]
				var stats = item["stats"][str(iterator)]
				return stats


func get_stats_by_xp(cardName:String, xp: int):
	load_json_data("res://Data/all_cards_data.json")
	if specific_data.has(cardName):
		for item in specific_data[cardName]:
			for i in range(1, item["stats"].size()+1):
				if(int(item["stats"][str(i)]["xp_min"]) < xp and int(item["stats"][str(i)]["xp_max"] > xp)):
					return int(i)



func _ready() -> void:
	##get_specific_data(card_name, level);
	#print(get_stats_by_xp("Circle", 32))
	
	#var hhh = get_specific_data("Square", 2)
	#print(hhh["xp_min"])
	
	print(get_specific_data("Square", 2))
	
