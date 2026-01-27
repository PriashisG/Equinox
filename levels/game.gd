extends Node2D


# Called when the node enters the scene tree for the first time.
var active_player
@onready var light_player: CharacterBody2D
@onready var shadow_player: CharacterBody2D
@onready var camera_2d: Camera2D = $player1/Camera2D
@onready var camera_2d_2: Camera2D = $player2/Camera2D2

var escaped=0


func _on_player_reached_exit(player):
	if(escaped == 2 ): get_tree().change_scene_to_file("res://scenes/mission complete.tscn")
	if(active_player == light_player):
		active_player = shadow_player
		#if(camera_2d): camera_2d.enabled = true
		if(is_instance_valid(shadow_player)): camera_2d.enabled = true;
		if(is_instance_valid(light_player)): camera_2d_2.enabled= false;
	else:
		active_player = light_player
		if(is_instance_valid(shadow_player)): camera_2d.enabled = false;
		if(is_instance_valid(light_player)): camera_2d_2.enabled= true;
	escaped+=1
	$CanvasLayer/Label.text = "Escaped: "+str(escaped)
	player.queue_free()

func _ready() -> void:
	light_player = $player2
	shadow_player = $player1
	active_player = shadow_player # or your camera name
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(escaped==2):
		Global.level+=1
		if(escaped == 2 ): get_tree().change_scene_to_file("res://scenes/mission complete.tscn")
	if Input.is_action_just_pressed("switch") and not escaped:
		if active_player == light_player:
			active_player = shadow_player
			camera_2d.enabled = true
			camera_2d_2.enabled= false;
		else:
			active_player = light_player
			camera_2d.enabled = false
			camera_2d_2.enabled= true;
	


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level choice.tscn")
