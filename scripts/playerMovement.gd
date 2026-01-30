extends CharacterBody2D

const SPEED = 350.0
const JUMP_VELOCITY = -450.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var shadow_camera: Camera2D = $"../player1/Camera2D"
@onready var light_camera: Camera2D = $"../player2/Camera2D2"
@onready var audio_running: AudioStreamPlayer2D = $Audio_running
@onready var audio_jumping: AudioStreamPlayer2D = $Audio_jumping
@onready var audio_gate: AudioStreamPlayer2D = $"../Audio_gate"

var push_force = 1500



func _physics_process(delta: float) -> void:
	# Add the gravity.
	var norachora = (self==get_parent().active_player)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and norachora:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if norachora:
		if direction:
			velocity.x = direction * SPEED
			if(!audio_running.playing and is_on_floor()):
				audio_running.play()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			audio_running.stop()
	else:
		velocity.x=0
	update_animation(direction,velocity,norachora);
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			var box = collision.get_collider()
			var push_dir = Vector2(-collision.get_normal().x, 0).normalized()
			if is_on_floor():
				box.apply_central_force(push_dir * push_force)

func update_animation(direction,velocity,norachora):
	if norachora:
		if not is_on_floor():    
			if velocity.y < 0:
				sprite.flip_h = direction < 0
				sprite.play("jump")
				if(!audio_jumping.playing):
					audio_jumping.play()
			else:
				audio_jumping.stop()
				sprite.flip_h = direction < 0
				sprite.play("fall")
		elif direction != 0:
			sprite.flip_h = direction < 0
			sprite.play("run")
		else:
			sprite.play("idle")
	else:
		sprite.play("idle")
