extends Resource
class_name BULLET

enum _type 
{bounce,linear,dup}
@export var NAME: String
@export var TYPE : _type
@export var QUANTITY : int : set = _set_quantity , get = _get_quantity
@export var LEVEL : int : set = _set_level , get =_get_level
@export var ALIVE_TIME : int = 100
@export var EFFECT : EFFECT
var max_level : int = 100
var max_quantity : int = 100


func _set_level (value : int):
	LEVEL = value
	if LEVEL > max_level :
		LEVEL = max_level
	return self

func _get_level () -> int : 	 return LEVEL

func _set_quantity (value : int):
	QUANTITY = value
	if QUANTITY > max_quantity :
		QUANTITY = max_quantity
	return self

func _get_quantity () -> int : 	 return QUANTITY

