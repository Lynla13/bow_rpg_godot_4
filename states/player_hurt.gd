extends STATE
class_name PLayerHurt

@export var actor : PLayer
@export var player : PLAYER
@export var animator : AnimationPlayer

signal _jump
signal _walk
signal _idle

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	animator.play("run")

func _exit_state () ->void :
	set_physics_process(true)
	print ("out")
	
func physics_process () : 
#Chek ground -> set run and jump
	pass
	
