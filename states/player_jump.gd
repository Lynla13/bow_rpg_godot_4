extends STATE
class_name PLayerJump

@export var actor : PLayer
@export var player : PLAYER
@export var animator : AnimatedSprite2D

signal _double_jump
signal _glide
signal  _idle
signal  _walk


func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	_animation ()

func _exit_state () ->void :
	set_physics_process(false)
	
func _animation () :
	animator.play("jump")

func _physics_process(delta):
	_jump (delta)


func _jump (delta):
	print ("hello")
	_idle.emit ()
			
