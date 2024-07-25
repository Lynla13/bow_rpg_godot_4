extends STATE
class_name PupetWonder
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
@export var animator : AnimationPlayer
var tween : Tween
@onready var eyes = $"../../../eyes"

signal _see_player
signal _hurt
signal _death
var direction = 1
var enemy_data 

func _ready():
	actor._enemy_data.connect (self._enemy_data)
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	

func _exit_state () ->void :
	print ('exit')
	set_physics_process(false)
	
func _physics_process (delta) : 
	if eyes.is_colliding():
		if eyes.get_collider().get_collision_layer() > 1 :
			direction *= -1
			actor.scale.x *= -1
		elif  eyes.get_collider().get_collision_layer() == 1 :
			_see_player.emit()
	actor.velocity.x = direction * enemy_data.SPEED*delta
	

func _enemy_data (data) :
	enemy_data = data
	
