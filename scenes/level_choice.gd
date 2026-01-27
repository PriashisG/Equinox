extends Control

@onready var lock: Sprite2D = $"Level 2/4-Lock"
@onready var lock_2: Sprite2D = $"level 3/4-Lock2"

func _ready() -> void:
	if(Global.level>=2):
		lock.visible = not lock.visible
	if(Global.level>=3):
		lock_2.visible = not lock_2.visible


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")

func _on_level_2_button_pressed() -> void:
	if(Global.level>=2): get_tree().change_scene_to_file("res://levels/level_2.tscn")


func _on_level_3_button_pressed() -> void:
	if(Global.level>=3): get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")
