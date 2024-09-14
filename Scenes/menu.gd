extends Node2D


func _on_collection_button_up() -> void:
	get_tree().change_scene_to_file("res://Collection/collection.tscn")


func _on_quit_button_up() -> void:
	get_tree().quit()


func _on_map_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/map.tscn")
