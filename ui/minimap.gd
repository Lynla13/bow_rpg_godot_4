extends SubViewportContainer

@export var target : NodePath
@onready var player := get_node (target)
@onready var camera = $SubViewport/Camera3D


func _process(delta):
	camera.make_current()
	#camera.position = player.position

# todo : finix dam sauce, tween, enemy_state, arrow_state (19/07/2024)
