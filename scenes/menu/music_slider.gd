extends HSlider

func _on_value_changed(new_value):
	Data.music = new_value
	Data.save()
