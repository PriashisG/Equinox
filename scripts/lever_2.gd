extends Area2D


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var upper_plat_anim: AnimationPlayer = $"../upper_plat/upper_plat_anim"


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
		sprite.play("active")
		upper_plat_anim.play("start")
		ok=true
	
