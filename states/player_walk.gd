extends STATE
class_name PLayerWalk

@export var actor : PLayer
@export var player_data : PLAYER
@export var animator : AnimationPlayer
signal _jump
signal _run
signal _idle

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	#animator.play("run")

func _exit_state () ->void :
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_jump.emit ()
	else :
		_move_left_right (delta)

func _move_left_right (delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		actor.velocity.x = direction * player_data.SPEED
	else :
		_idle.emit ()
			


