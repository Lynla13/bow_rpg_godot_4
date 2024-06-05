extends Node

func _on_left_pressed():
	Input.action_press("ui_left")


func _on_right_pressed():
	Input.action_press("ui_right")


func _on_left_released():
	Input.action_release("ui_left")


func _on_right_released():
	Input.action_release("ui_right")
