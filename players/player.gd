extends Resource
class_name PLAYER

@export var NAME : String
enum _class
{All, D, A}
enum _status 
{Die, Alive, Buff}
@export var STATUS : _status : set = _set_health, get =_get_health
@export var CLASS : _class
@export_multiline var DETAIL : String
@export var POWER : int
@export var SPEED : int
@export var FIRE_SPEED : int
@export var HEALTH : int: set = _set_health, get =_get_health
@export var MANA: int
@export var DIRECTION : int : set = _set_direction
@export var EFFECT : EFFECT
signal _die (a,b)
signal _health_change (a,b)
signal _change_drection (value)

func _set_health (new_value: int) :
	HEALTH = new_value
	_health_change.emit()
	return self

func _get_health () -> int :	return HEALTH

func _set_status (new_value: _status) :
	STATUS = new_value
	if STATUS == 0:
		_die.emit(1,2)
		print (_status.keys()[STATUS])
	return self

func _get_status () -> _status :	return STATUS

func _set_direction (value : bool) :
	DIRECTION = value
	_change_drection.emit()
	return self
