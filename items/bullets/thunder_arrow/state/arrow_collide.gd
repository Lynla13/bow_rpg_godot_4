extends STATE
class_name Thunder_Arrow_Collide

@export var actor : Area2D
var tween : Tween
signal _out


func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)
	

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	print ("this is collide")
	# stsend emit to dam sauce to deal dame to moner
	
func _collide () :
	pass

func _tween ():
	pass


func _on_arrow_fire__collie_data(target):
	#DameSauce.
	pass


#Send thunder to radius in a time
