extends STATE
class_name Arrow_Power

@export var actor : Area2D
var tween : Tween
signal _fire
signal  _collide
signal _out


func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	pass
	

func _tween ():
	pass
