extends CharacterBody2D
class_name PLayer

@export var player : PLAYER
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player_spite = $Player_Spite

@onready var fsm = $Player_Spite/FiniteStateMachine_Lower
@onready var p_layer_hurt = $Player_Spite/FiniteStateMachine_Lower/PLayerHurt
@onready var p_layer_run = $Player_Spite/FiniteStateMachine_Lower/PLayerRun
@onready var p_layer_idle = $Player_Spite/FiniteStateMachine_Lower/PLayerIdle
@onready var p_layer_walk = $Player_Spite/FiniteStateMachine_Lower/PLayerWalk
@onready var p_layer_jump = $Player_Spite/FiniteStateMachine_Lower/PLayerJump

@onready var ani = $Animation
@onready var upper = $Player_Spite/Player/Upper

@onready var weapon = $Player_Spite/Player/Upper/Weapon
@onready var hat = $Player_Spite/Player/Hat
@onready var cape = $Player_Spite/Player/Cape
@onready var bottom = $Player_Spite/Player/Bottom
@onready var top = $Player_Spite/Player/Top

signal _player_data (data)

func _ready():
	emit_signal("_player_data",player)
	p_layer_idle._walk.connect (fsm._change_state.bind(p_layer_walk))
	p_layer_idle._idle.connect (fsm._change_state.bind(p_layer_idle))
	p_layer_idle._jump.connect (fsm._change_state.bind (p_layer_jump))

	p_layer_walk._idle.connect (fsm._change_state.bind(p_layer_idle))
	p_layer_run._idle.connect (fsm._change_state.bind(p_layer_idle))
	p_layer_walk._jump.connect (fsm._change_state.bind (p_layer_jump))

	p_layer_jump._idle.connect (fsm._change_state.bind(p_layer_idle))
	p_layer_jump._walk.connect (fsm._change_state.bind(p_layer_walk))

	ItemUse._equip_item.connect(self._on_equip_item)

func _physics_process(delta):
	_look_at ()
	move_and_slide()
	_gravity (delta)
	_on_Player_weapon_use()


func _gravity (delta) :
	if not is_on_floor():
		velocity.y += gravity * delta

func _is_on_floor () -> bool:
	if is_on_floor() :
		return true
	else:
		return false
	

# Hack : optimize this later ,fixing mouse moverment
func _look_at () :
	upper.look_at(get_global_mouse_position())
	#if upper.rotation_degrees > 20 :	upper.rotation_degrees = 20
	#if upper.rotation_degrees < -60 :	upper.rotation_degrees = -60



func _on_Player_weapon_use():
	var arr = weapon.get_children()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) :
		if  weapon.get_children() != []:
			arr [0]._use_weapon (upper.rotation_degrees)

#Set dame sauce here
func _on_equip_item (item):
	DameControl.is_equipment_change = true
	
	#Add stat to DameSauce
	if item is ITEM : 
		var equip_ = item.ITEM
		var equipment_intance = equip_.instantiate()
		var x = item.TYPE
		match x :
			1: 
				top.add_child(equipment_intance)
				DameControl.top_dame = item.DAME
				DameControl.top_crtdame = item.CRTDAME
				DameControl.top_def = item.DEF
				DameControl.top_health = item.HEALTH
				DameControl.top_speed = item.SPEED
			2 :
				bottom.add_child(equipment_intance)
				DameControl.bottom_dame = item.DAME
				DameControl.bottom_crtdame = item.CRTDAME
				DameControl.bottom_def = item.DEF
				DameControl.bottom_health = item.HEALTH
				DameControl.bottom_speed = item.SPEED
			3 :
				hat.add_child(equipment_intance)
				DameControl.hat_dame = item.DAME
				DameControl.hat_crtdame = item.CRTDAME
				DameControl.hat_def = item.DEF
				DameControl.hat_health = item.HEALTH
				DameControl.hat_speed = item.SPEED
			4 :
				cape.add_child(equipment_intance)
				DameControl.cape_dame = item.DAME
				DameControl.cape_crtdame = item.CRTDAME
				DameControl.cape_def = item.DEF
				DameControl.cape_health = item.HEALTH
				DameControl.cape_speed = item.SPEED
			5 :
				weapon.add_child(equipment_intance)
				DameControl.weapon_dame = item.DAME
				DameControl.weapon_crtdame = item.CRTDAME
				DameControl.weapon_def = item.DEF
				DameControl.weapon_health = item.HEALTH
				DameControl.weapon_speed = item.SPEED
		item.IS_EQUIPED = false
	if weapon.get_children().size() > 1 : 		weapon.get_child (0).queue_free()
	if top.get_children().size() > 1 : 		top.get_child(0).queue_free()
	if bottom.get_children().size() > 1 : 		bottom.get_child (0).queue_free()
	if hat.get_children().size() > 1 : 		hat.get_child (0).queue_free()
	if cape.get_children().size() > 1 : 		cape.get_child (0).queue_free()
