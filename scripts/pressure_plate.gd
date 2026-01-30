extends StaticBody2D
@onready var area: Area2D = $pressureArea2d
@onready var anim: AnimationPlayer = $pressureAnimation
# Called when the node enters the scene tree for the first time.
@onready var audio_gate: AudioStreamPlayer2D = $"../Audio_gate"
var bodies_on_plate := 0
@onready var gate_animation: AnimationPlayer = $"../gate/gateAnimation"
func _ready():
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("weight"):
		bodies_on_plate += 1
		if bodies_on_plate == 1:
			if(!audio_gate.playing):
				audio_gate.play()
			anim.play("down")
			gate_animation.play("open")

func _on_body_exited(body):
	if body.is_in_group("weight"):
		bodies_on_plate -= 1
		audio_gate.stop();
		if bodies_on_plate <= 0:
			anim.play("up")
			gate_animation.play("close")
