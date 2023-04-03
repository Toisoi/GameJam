extends Area2D

@export var _fade_in_time = 1.0
@export var _fade_out_time = 1.0

func _ready():
	modulate.a = 0

func _on_body_entered(player: Player):
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_LINEAR)
	modulate.a = 0
	tween.tween_property(self, "modulate:a", 1, _fade_in_time)
	tween.play()


func _on_body_exited(player: Player):
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_LINEAR)
	modulate.a = 1
	tween.tween_property(self, "modulate:a", 0, _fade_out_time)
	tween.play()
