extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if(get_parent().escaped==2): get_tree().change_scene_to_file("res://scenes/Level choice.tscn")
	if body.is_in_group("player"):
		get_parent()._on_player_reached_exit(body)
