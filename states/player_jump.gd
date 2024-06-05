extends STATE
class_name PLayerJump

@export var actor : PLayer
@export var player : PLAYER
@export var animator : AnimationPlayer
signal _double_jump
signal _glide


func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	animator.play("jump")

func _exit_state () ->void :
	set_physics_process(true)
	
