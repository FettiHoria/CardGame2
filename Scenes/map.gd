extends Node2D


func _on_button_button_up() -> void:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_button_2_button_up() -> void:
	get_tree().change_scene_to_file("res://Maps/map1.tscn")
