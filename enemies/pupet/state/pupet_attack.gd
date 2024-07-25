extends STATE
class_name PupetAttack
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
@export var animator : AnimationPlayer
var tween : Tween
@onready var eyes = $"../../../eyes"
var enemy_data 

signal _wonder
signal _hurt
signal _death

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(true)
	
func _physics_process (delta) : 
	if eyes.is_colliding():
		if  eyes.get_collider().get_collision_layer() == 1 :
				actor.velocity.x = 10*100*delta
		else :
			_wonder.emit()
	else :
		_wonder.emit()

func _enemy_data (data) :
	enemy_data = data

func _attack () :
	pass
