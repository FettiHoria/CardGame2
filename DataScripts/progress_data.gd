extends Node

var specific_data = {}

func load_json_data(file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json_data = file.get_as_text()
		specific_data = JSON.parse_string(json_data)
		file.close()
	else:
		print("Failed to open file: ", file_path)


# Funcția pentru salvarea datelor în fișierul JSON
func save_updates_card_collection(file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_data = JSON.stringify(specific_data)  # Convertim dicționarul în string JSON
		file.store_string(json_data)
		file.close()
	else:
		print("Failed to open file for saving: ", file_path)


# Funcția pentru actualizarea stats-urilor
func set_card_xp(cardName: String, xp: int) -> void:
	if specific_data.has(cardName):
		#print(specific_data[cardName])
		for item in specific_data[cardName]:
			item["xp"] = xp


func unlock_card(cardName: String) -> void:
	if specific_data.has(cardName):
		#print(specific_data[cardName])
		for item in specific_data[cardName]:
			item["unlocked"] = "1"

func lock_card(cardName: String) -> void:
	if specific_data.has(cardName):
		#print(specific_data[cardName])
		for item in specific_data[cardName]:
			item["unlocked"] = "0"


func _ready() -> void:
	##get_specific_data(card_name, level);
	#print(get_stats_by_xp("Circle", 32))
	
	#var hhh = get_specific_data("Square", 2)
	#print(hhh["xp_min"])
	
	#print(get_specific_data("Square", 2))
	
	load_json_data("res://Data/save1.json")
	
	set_card_xp("Circle", 21)
	set_card_xp("Square", 22)
	set_card_xp("Rectangle", 23)
	unlock_card("Circle")
	unlock_card("Square")
	
	save_updates_card_collection("res://Data/save1.json")
