extends STATE
class_name PupetWonder
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
@export var animator : AnimatedSprite2D
var tween : Tween
@onready var eyes = $"../../../eyes"
@onready var back_eyes = $"../../../back_eyes"

signal _see_player
signal _hurt
signal _death
var direction = -1

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	_animation()
	

func _animation () :
	animator.play("run")

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	if eyes.is_colliding():
		if eyes.get_collider().get_collision_layer() > 1 :
			actor.scale.x *=-1
		elif  eyes.get_collider().get_collision_layer() == 1 :
			_see_player.emit()
	else: 
		direction = -1
		actor.velocity.x = direction *actor.enemy_data.SPEED*delta
	
