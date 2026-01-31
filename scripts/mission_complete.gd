extends Control
@onready var audio_complete: AudioStreamPlayer2D = $Audio_complete
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!audio_complete.playing):
		audio_complete.play()
