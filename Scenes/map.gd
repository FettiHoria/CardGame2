extends Node2D


func _on_button_button_up() -> void:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_button_2_button_up() -> void:
	get_tree().change_scene_to_file("res://Maps/map1.tscn")


func _on_button_3_button_up() -> void:
	var map_scene = load("res://Maps/map2.tscn").instantiate()
	map_scene.enemy_data = [{ "attack": "1", "health": "1", "level": "1", "name": "rat", "img":"res://images/rat.png", "pos_x":100, "pos_y":200}, 
							{ "attack": "1", "health": "1", "level": "1", "name": "rat", "img":"res://images/rat.png", "pos_x":200, "pos_y":200},
							{ "attack": "1", "health": "1", "level": "1", "name": "rat", "img":"res://images/rat.png", "pos_x":300, "pos_y":200},
							{ "attack": "1", "health": "1", "level": "1", "name": "rat", "img":"res://images/rat.png", "pos_x":400, "pos_y":200}
							]
	get_tree().root.add_child(map_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = map_scene
	
	#print(CollectionDataRead.get_slots_data())
	var card_dict = CollectionDataRead.get_slots_data()
	
	for key in card_dict.keys():
		var card_list = card_dict[key]  # Obținem lista de obiecte
		for card in card_list:  # Parcurgem fiecare obiect din listă
			print("Key:", key, "Shape Name:", card["name"])
			print(CollectionDataRead.get_specific_data(card["name"], 1))
	
