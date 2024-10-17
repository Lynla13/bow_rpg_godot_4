extends STATE
class_name EnemyHurt
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
var tween : Tween

var knockback = Vector2.ZERO
@onready var hp = $"../../../HP"
signal _wonder
signal _hurt
signal _death

func _ready():
	set_physics_process(false)
	print ("ready")
	hp.show()
	await get_tree().create_timer(0.4).timeout
	hp.hide()
	hp.min_value = 0
	hp.max_value = actor.enemy_data.HP

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	print ("enemy_hurt")
	hp.value = actor.enemy_data.HP
	_knock_back(DameControl.total_knockback)
	if actor.enemy_data.HP <= 0 :
		emit_signal("_death")
	
func _dame (dame) :
	#Physiz is global
	Physiz.__show_dame(dame, actor)


func _knock_back (knockback_power) :
	var direction_vector = DameControl.dame_direction
	actor.velocity.x = direction_vector.x *knockback_power
	await get_tree().create_timer(0.3).timeout
	_wonder.emit()