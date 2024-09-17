extends STATE
class_name Arrow_Out

@export var actor : Area2D
var tween : Tween
signal _idle


func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	_self_destroy ()
	
func _self_destroy ():
	await get_tree().create_timer(3).timeout
	actor.queue_free()

func _tween ():
	pass
