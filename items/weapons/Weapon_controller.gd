extends StaticBody2D
class_name WEAPON_CONTROLLER

@export var weapon : ITEM
var smooth_mouse_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = -40

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_v_slider_value_changed(value):
	rotation_degrees = value
