extends Resource
class_name ITEM

enum _type 
{item,bullet,weapon, hat}
@export var NAME : String
@export_category("Main Category")
@export var SPEED : int
@export var DAM : int
@export var HEALTH : int
@export_range(1, 100) var QUANTITY : int
@export var TYPE : _type
@export_category("Extra Category")
@export var STACKABLE : bool = false
@export var COMSUMABLE : bool = false
@export var IS_EQUIPED : bool = false
@export_multiline var DESCRIPTION : String
@export_range(1, 5) var STAR : int
@export var MAX_STACK : int = 60
@export_category("")
@export var BULLET : BULLET
@export var TEXTURE : Texture
@export var ITEM : ITEM
@export var _EFFECT : EFFECT	


func _is_use () :
	if QUANTITY >=1: 
		if TYPE == 0  :
			QUANTITY =-1 
		elif TYPE >= 1:
			IS_EQUIPED != IS_EQUIPED
			# AUTOLOAD
			if IS_EQUIPED : 	 ItemUse.__equip_item(self)
			elif !IS_EQUIPED: 	 ItemUse.__remove_equip(self)

