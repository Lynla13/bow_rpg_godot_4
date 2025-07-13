extends STATE
class_name PLayerJump

@export var actor : PLayer
@export var player : PLAYER
@export var animator : AnimatedSprite2D

@export var jump_height : float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = ((2.0*jump_height)/jump_time_to_peak)* -1.0
@onready var jump_gravity : float = ((-2.0 *jump_height) / (jump_time_to_peak *jump_time_to_peak)) *-1.0
@onready var fall_gravity : float = ((-2.0 *jump_height) / (jump_time_to_descent *jump_time_to_descent)) *-1.0
var jump_count : int = 2
signal _dash
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
	print ("Jump")
	actor.velocity.y += get_gravity()*delta
	print (Utlize.direction)
	actor.velocity.x = Utlize.direction * player.SPEED
	print (actor.velocity.x)
	print (actor.velocity.y)
	_jump()
	if actor._is_on_floor() or actor.velocity.y <= 400: 
		jump_count = 1
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		_walk.emit ()
	else : _idle.emit()
	

func get_gravity () :
	return jump_gravity if actor.velocity.y < 0.0 else fall_gravity

func _jump ():
	actor.velocity.y = jump_velocity
	if jump_count>0 :
		jump_count -= 1
# Hack : rework jump
