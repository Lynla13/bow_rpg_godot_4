extends STATE
class_name EnemySeePlayer
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
@export var animator : AnimatedSprite2D
var tween : Tween
@onready var eyes = $"../../../eyes"
@onready var back_eyes = $"../../../back_eyes"
@onready var warning = $"../../../warning"
signal _wonder
signal _attack
signal _hurt
signal _death

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(false)

func _physics_process (delta) : 
	_see_player (delta)
	await get_tree().create_timer(0.5).timeout
	warning.hide()
	_attack.emit()
#Chek ground -> set run and jump

func _see_player (delta) :
	actor.velocity.y = 0*delta
	actor.velocity.x = 0*delta
	warning.show()
