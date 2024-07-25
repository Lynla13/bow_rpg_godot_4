extends Resource
class_name PLAYER

@export var NAME : String
enum _status 
{Die, Alive, Buff}
@export var STATUS : _status : set = _set_health, get =_get_health
@export_multiline var DETAIL : String
@export var SPEED : int
@export var HEALTH : int: set = _set_health, get =_get_health
var CRIT_DAME : int
var CRIT_RATE : int
@export var MANA: int
@export var MIN_DAME : int
@export var MAX_DAME : int
@export var DAME_DELTA_TIME : int
@export var WEAPON : ITEM
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
	return self

func _get_status () -> _status :	return STATUS


