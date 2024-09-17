extends CharacterBody2D


@export var enemy_data : ENEMY
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var fsm = $Sprite2D/FiniteStateMachine
@onready var pupet_wonder = $Sprite2D/FiniteStateMachine/PupetWonder
@onready var enemy_see_player = $Sprite2D/FiniteStateMachine/EnemySeePlayer
@onready var enemy_death = $Sprite2D/FiniteStateMachine/EnemyDeath
@onready var enemy_hurt = $Sprite2D/FiniteStateMachine/EnemyHurt
@onready var pupet_attack = $Sprite2D/FiniteStateMachine/PupetAttack

signal _enemy_data (data)
signal _enemy_hurt (dame)
signal _target_dame (dame)
# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("_enemy_data",enemy_data)
	#wonder
	pupet_wonder._see_player.connect (fsm._change_state.bind(enemy_see_player))
	pupet_wonder._hurt.connect (fsm._change_state.bind(enemy_hurt))
	pupet_wonder._death.connect (fsm._change_state.bind(enemy_death))
	
	#see player
	enemy_see_player._attack.connect (fsm._change_state.bind (pupet_attack))
	enemy_see_player._hurt.connect (fsm._change_state.bind(enemy_hurt))
	enemy_see_player._death.connect (fsm._change_state.bind(enemy_death))
	
	#attack 
	pupet_attack._wonder.connect (fsm._change_state.bind (pupet_wonder))
	
	#hurt
	enemy_hurt._death.connect (fsm._change_state.bind (enemy_death))
	self._enemy_hurt.connect(fsm._change_state.bind (enemy_hurt))
	self._target_dame.connect (self.__is_dame)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_slide()
	_gravity(delta)

func _gravity (delta) :
	if not is_on_floor():
		velocity.y += gravity * delta
	
func __is_dame (dame) :
	enemy_data.HP -= dame
	Physiz.__show_dame(dame, self)
	if enemy_data.HP < 0 :
		enemy_data.HP = 0
