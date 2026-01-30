extends Area2D


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var lower_plat_anim: AnimationPlayer = $"../lower_plat/lower_plat_anim"

var ok:bool = false
var inside:bool = false

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player") and body==get_parent().active_player):
		inside = true


func _on_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player") and body==get_parent().active_player):
		inside = false
	
func _process(delta: float) -> void:
	if((get_parent().active_player in get_overlapping_bodies()) and  not ok and Input.is_action_just_pressed("lever")):
		sprite.play("active")
		lower_plat_anim.play("lowStart")
		ok=true
	
