extends STATE
class_name PLayerRun

@export var actor : PLayer
@export var player : PLAYER
@export var animator : AnimatedSprite2D

signal _jump
signal _walk
signal _idle

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(true)
	
func physics_process () : 
#Chek ground -> set run and jump
	pass
	
