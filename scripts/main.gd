extends Control

@onready var transitioner := $Transitioner
@export var transition_time = 1.0

func _on_trans_up_pressed():
	transitioner.transition_scene(self, "res://scenes/main.tscn", transition_time, Tween.TRANS_SINE, Tween.EASE_OUT, BTrans.DIRECTION.UP)

func _on_trans_down_pressed():
	transitioner.transition_scene(self, "res://scenes/main.tscn", transition_time, Tween.TRANS_SINE, Tween.EASE_OUT, BTrans.DIRECTION.DOWN)

func _on_trans_left_pressed():
	transitioner.transition_scene(self, "res://scenes/main.tscn", transition_time, Tween.TRANS_SINE, Tween.EASE_OUT, BTrans.DIRECTION.LEFT)

func _on_trans_right_pressed():
	transitioner.transition_scene(self, "res://scenes/main.tscn", transition_time, Tween.TRANS_SINE, Tween.EASE_OUT, BTrans.DIRECTION.RIGHT)


func _on_time_slider_value_changed(value):
	transition_time = value
	$VBoxContainer/TransitionTIme.text = "Transition Time: " + str(transition_time) + "s"

func _on_window_resizing_pressed():
	transitioner.allow_window_resizing = !transitioner.allow_window_resizing
	$VBoxContainer/WindowResizing.text = "Allow Window Resizing: " + str(transitioner.allow_window_resizing)
