extends CharacterBody2D
class_name DeadPlayer

@export var sprite: Sprite2D

@export var _gravity = 9.8

func _physics_process(_delta):
	velocity.y += _gravity
	move_and_slide()
	velocity.x = 0


func push(axis: float) -> void:
	velocity.x = axis
