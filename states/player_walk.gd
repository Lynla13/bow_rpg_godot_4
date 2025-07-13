extends STATE
class_name PLayerWalk

@export var actor : PLayer
@export var player_data : PLAYER
@export var animator : AnimatedSprite2D

signal _jump
signal _run
signal _idle

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	_animation () 

func _exit_state () ->void :
	set_physics_process(false)

func _animation () :
	animator.play("run")
	
func _physics_process(delta):
	print ("Walk")
	if Input.is_action_pressed("ui_accept"):
		_jump.emit ()
	else :
		_move_left_right (delta)

func _move_left_right (delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction == -1:	 Utlize.direction = -1
		else:	Utlize.direction = 1
		actor.velocity.x = direction * player_data.SPEED
	elif Input.is_action_just_pressed("ui_accept"):
		_jump.emit ()
	else :
		_idle.emit ()
			
