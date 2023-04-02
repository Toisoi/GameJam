extends CharacterBody2D
class_name Player

@export var _animated_sprite: AnimatedSprite2D
@export var _audio_player: AudioStreamPlayer

@export var _dead_players_group: Node

@export var _dead_player: PackedScene

@export var jump_sound: AudioStreamWAV
@export var hit_sound: AudioStreamWAV

@export var move_speed = 300
@export var jump_strength = 300
@export var push_strength = 100
@export var fall_jump_timer = 0.1
@export var gravity = 9.8

@onready var level: Level = owner

var dead = false
var checpoint_position: Vector2

func _ready():
	checpoint_position = global_position


func get_axis() -> float:
	return Input.get_axis("move_left", "move_right")


func apply_movement() -> void:
	velocity.x = get_axis() * move_speed


func apply_gravity() -> void:
	velocity.y += gravity


func move() -> void:
	move_and_slide()


func flip() -> void:
	var axis = get_axis()
	if axis > 0:
		_animated_sprite.flip_h = false
	elif axis < 0:
		_animated_sprite.flip_h = true


func play_animation(animation: StringName) -> void:
	if _animated_sprite.animation != "hit":
		_animated_sprite.play(animation)


func play_sound(sound: AudioStreamWAV) -> void:
	_audio_player.stream = sound
	_audio_player.play()


func die() -> void:
	_animated_sprite.play("hit")
	play_sound(hit_sound)
	
	level.lives_left -= 1
	dead = true
	
	await _animated_sprite.animation_finished
	
	var dead_player = _dead_player.instantiate()
	dead_player.global_position = global_position
	dead_player.sprite.flip_h = _animated_sprite.flip_h
	_dead_players_group.add_child(dead_player)
	
	global_position = checpoint_position
	_animated_sprite.play("idle")
	
	dead = false
