extends SubViewport

@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.

func _process(delta):
	camera.position = owner.find_child("Player").position
