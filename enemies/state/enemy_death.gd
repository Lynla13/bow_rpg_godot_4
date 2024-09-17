extends STATE
class_name EnemyDeath
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
var tween : Tween

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	actor.queue_free()
	pass
	
