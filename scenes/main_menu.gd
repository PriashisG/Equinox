extends Control
@onready var audio_hover: AudioStreamPlayer2D = $Audio_hover
@onready var audio_click: AudioStreamPlayer2D = $Audio_click






func _on_start_game_pressed() -> void:
	audio_click.play();
	await audio_click.finished;
	get_tree().change_scene_to_file("res://scenes/Stroy.tscn")

func _on_controls_pressed() -> void:
	audio_click.play();
	await audio_click.finished;
	get_tree().change_scene_to_file("res://scenes/Controls.tscn")

func _on_exit_pressed() -> void:
	audio_click.play();
	await audio_click.finished;
	get_tree().quit()
