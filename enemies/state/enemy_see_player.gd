extends STATE
class_name EnemySeePlayer
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
var tween : Tween

signal _wonder
signal _attack
signal _hurt
signal _death

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	print ('exit')
	set_physics_process(false)
	
func _physics_process (delta) : 
	actor.velocity.x = 1*0*delta
	await get_tree().create_timer(0.5).timeout
	_attack.emit()
#Chek ground -> set run and jump

func _see_player () :
	# add some animation to warning
	pass
