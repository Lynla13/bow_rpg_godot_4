extends CharacterBody2D
class_name PLayer

@export var player : PLAYER
@export var animator : AnimationPlayer
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player_spite = $Player_Spite

@onready var fsm = $Player_Spite/FiniteStateMachine_Lower
@onready var p_layer_hurt = $Player_Spite/FiniteStateMachine_Lower/PLayerHurt
@onready var p_layer_run = $Player_Spite/FiniteStateMachine_Lower/PLayerRun
@onready var p_layer_idle = $Player_Spite/FiniteStateMachine_Lower/PLayerIdle
@onready var p_layer_walk = $Player_Spite/FiniteStateMachine_Lower/PLayerWalk

@onready var upper = $Player_Spite/Upper
@onready var upper_body_tk = $Player_Spite/Upper/Upper_Body_TK


func _ready():
	animator.play("fire")
	p_layer_idle._walk.connect (fsm._change_state.bind(p_layer_walk))
	p_layer_idle._idle.connect (fsm._change_state.bind(p_layer_idle))
	
	p_layer_walk._idle.connect (fsm._change_state.bind(p_layer_idle))
	p_layer_run._idle.connect (fsm._change_state.bind(p_layer_idle))
	
func _physics_process(delta):
	move_and_slide()
	_gravity (delta)
	_move_left_right (delta)
	
func _gravity (delta) :
	if not is_on_floor():
		velocity.y += gravity * delta

func _move_left_right (delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	print (scale.x)
	if direction:
		if direction == 1 :
			player_spite.scale.x = 1
		elif direction == -1:
			player_spite.scale.x = -1
	

func _on_v_slider_value_changed(value):
	upper.rotation_degrees = value
	upper_body_tk.position.y = value
