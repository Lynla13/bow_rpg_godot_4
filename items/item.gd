extends Resource
class_name ITEM

enum _type 
{item,top,bottom,hat,cape,weapon}
@export var NAME : String
@export var TEXTURE : Texture
@export_range(1, 200) var QUANTITY : int
@export_category("Weapon Category")
@export var SPEED : int
@export var KNOCKBACK : int
@export var HEALTH : int
@export var DAME : int 
@export var CRTDAME : int 
@export var DEF : int
@export var TYPE : _type
@export_category("Extra Category")
@export var STACKABLE : bool = false
@export var COMSUMABLE : bool = false
@export var IS_EQUIPED : bool = false
@export_multiline var DESCRIPTION : String
@export_range(1, 5) var STAR : int
@export_category("")
@export var ITEM : PackedScene


#todo : setter, for Dame, crtDame, ctrrate
#Note : Set dame for weapon and equipement here
func _is_use () :
	if QUANTITY >=1: 
		if TYPE == 0 :
			QUANTITY -= 1 
			ItemUse.__use_item(self)
		elif TYPE >= 1:
			IS_EQUIPED = !IS_EQUIPED
			# AUTOLOAD
			if IS_EQUIPED :	ItemUse.__equip_item(self)
			elif IS_EQUIPED == false:	ItemUse.__remove_equip(self)
