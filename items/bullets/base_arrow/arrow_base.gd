extends Area2D

@export var mass = 0.25

var is_launched = false
var velocity = Vector2(0,0)

@onready var speed = 600
@onready var fsm = $FiniteStateMachine
@onready var arrow_collide = $FiniteStateMachine/Arrow_Collide
@onready var arrow_fire = $FiniteStateMachine/Arrow_Fire
@onready var arrow_out = $FiniteStateMachine/Arrow_Out

signal _fire (initial_velocity)

func _ready():
	#fire
	arrow_fire._collide.connect (fsm._change_state.bind(arrow_collide))
	arrow_fire._out.connect (fsm._change_state.bind(arrow_out))
	#collide
	arrow_collide._out.connect (fsm._change_state.bind(arrow_out))
	#out
	#Physiz._use_arrow_power.connect (fsm._change_state.bind(arrow_power))

func _fire_state (initial_velocity : Vector2) :
	emit_signal("_fire" , initial_velocity)
