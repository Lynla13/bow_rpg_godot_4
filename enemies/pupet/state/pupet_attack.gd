extends STATE
class_name PupetAttack
# setup enymy move when dont see player here
@export var actor : CharacterBody2D
@export var animator : AnimatedSprite2D
var tween : Tween
@onready var eyes = $"../../../eyes"
@onready var back_eyes = $"../../../back_eyes"
var enemy_data 
signal _wonder
signal _hurt
signal _death
var direction = 1
const enemy_bullet = preload("res://items/bullets/enemy_arrow/enemy_bullet.tscn")

func _ready():
	set_physics_process(false)

func _enter_state () ->void :
	set_physics_process(true)

func _exit_state () ->void :
	set_physics_process(false)
	
func _physics_process (delta) : 
	if eyes.is_colliding():
		if  eyes.get_collider().get_collision_layer() == 1 :
				enemy_attack(delta)
		else :
			await get_tree().create_timer(1).timeout
			_wonder.emit()
	elif back_eyes.is_colliding() :
		actor.scale.x *=-1
		enemy_attack(delta)
	else: 
		_wonder.emit()

func _enemy_data (data) :
	enemy_data = data


func enemy_attack (delta) :
	_move(delta)


func _move (delta) :
	actor.enemy_data.SPEED = 8000
	actor.velocity.x = direction *actor.enemy_data.SPEED*delta
	await get_tree().create_timer(1).timeout
	_attack(delta)

func _attack (delta):
	actor.velocity.x = -direction *actor.enemy_data.SPEED*delta
	actor.velocity.y = -direction *actor.enemy_data.SPEED*delta
