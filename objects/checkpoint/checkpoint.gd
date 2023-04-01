extends Area2D

@export var _animated_sprite: AnimatedSprite2D
@export var _particles: CPUParticles2D

var _set_up = false

func _on_body_entered(player: Player):
	if not _set_up:
		player.checpoint_position = global_position
		
		_set_up = true
		
		_particles.emitting = true
		_animated_sprite.play("flag_out")
		await _animated_sprite.animation_finished
		_animated_sprite.play("normal")
