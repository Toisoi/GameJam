extends HSlider

func _on_value_changed(new_value):
	Data.sound = new_value
	Data.save()
