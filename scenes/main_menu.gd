extends Control

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Stroy.tscn")

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Controls.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
