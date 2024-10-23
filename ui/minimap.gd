extends SubViewportContainer

@export var target : NodePath
@onready var player := get_node (target)
@onready var camera = $SubViewport/Camera3D


func _physics_process(_delta):
	camera.position = player.position
