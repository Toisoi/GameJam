extends State
class_name PlayerState

var player: Player

func _ready():
	await owner.ready
	player = owner


func physics_update(_delta):
	for index in player.get_slide_collision_count():
		var collision = player.get_slide_collision(index)
		if collision.get_collider() is DeadPlayer:
			collision.get_collider().push(-collision.get_normal().x * player.push_strength)
