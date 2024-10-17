extends STATE
class_name Arrow_Fire


@export var actor : Area2D
var tween : Tween
signal _collide
signal  _collie_data (target)
signal _out

func _ready():
	set_physics_process(false)
	actor._fire.connect(self._launch)

func _enter_state () ->void :
	set_physics_process(true)
	

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	if actor.is_launched :
		actor.velocity += actor.gravity_direction*actor.gravity
		actor.position += actor.velocity*delta
		actor.rotation = actor.velocity.angle()

	
func _launch (initial_velocity):
	actor.is_launched = true
	actor.velocity = initial_velocity

func _tween ():
	pass


func _on_arrow_base_area_entered(area):
	actor.velocity = Vector2 (0,0)
	emit_signal("_collide")
