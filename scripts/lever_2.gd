extends Area2D


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var upper_plat_anim: AnimationPlayer = $"../upper_plat/upper_plat_anim"
@onready var audio_lever: AudioStreamPlayer2D = $"../Audio_lever"


var ok:bool = false
var inside:bool = false

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		inside = true


func _on_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player")):
		inside = false
	
func _process(delta: float) -> void:
	if((get_parent().active_player in get_overlapping_bodies()) and not ok and Input.is_action_just_pressed("lever")):
		if(!audio_lever.playing):
			audio_lever.play();
		sprite.play("active")
		upper_plat_anim.play("start")
		ok=true
	
