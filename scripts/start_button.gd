extends Control
@onready var start_button: Button = $"."

func _on_start_button_pressed():
	get_tree().change_scene("res://scenes/levels/level1_.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()
	
