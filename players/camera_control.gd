extends Node

@onready var camera_2d = $"../../Camera2D"
@onready var camera_slider = $Camera_slider

# Called when the node enters the scene tree for the first time.
func _ready():
	camera_slider.min_value = 1
	camera_slider.max_value = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().physics_frame
	if not camera_2d:
		return
	camera_2d.zoom.x = camera_slider.value
	camera_2d.zoom.y = camera_slider.value
