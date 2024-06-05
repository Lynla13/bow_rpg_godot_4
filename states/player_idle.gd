extends STATE
class_name PLayerIdle

@export var actor : PLayer
@export var player_data : PLAYER
@export var animator : AnimationPlayer

signal _jump
signal  _walk
signal  _idle

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	#animator.play("idle")

func _exit_state () ->void :
	set_physics_process(true)
	

func _physics_process(delta): 
	actor.velocity.x = 0
	if Input.is_action_just_pressed("ui_right") :
		_walk.emit ()
	elif Input.is_action_just_pressed("ui_accept"):
		_jump.emit ()
	elif Input.is_action_just_pressed("ui_left"):
		_walk.emit ()
