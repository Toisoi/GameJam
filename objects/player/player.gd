extends CharacterBody2D
class_name Player

@export var animated_sprite: AnimatedSprite2D
@export var _collision_shape: CollisionShape2D

@export var _dead_player: PackedScene

@export var move_speed = 300
@export var jump_strength = 300
@export var push_strength = 100
@export var fall_jump_timer = 0.1
@export var gravity = 9.8

var checpoint_position: Vector2

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
		animated_sprite.flip_h = false
	elif axis < 0:
		animated_sprite.flip_h = true


func die() -> void:
	_collision_shape.disabled = true
	
	animated_sprite.play("hit")
	await animated_sprite.animation_finished
	
	var dead_player = _dead_player.instantiate()
	dead_player.position = position
