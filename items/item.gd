extends Resource
class_name ITEM

enum _type 
{item,top,bottom,hat,cape,weapon}
@export var NAME : String
@export var TEXTURE : Texture
@export_range(1, 100) var QUANTITY 
@export_category("Weapon Category")
@export var SPEED : int
@export var KNOCKBACK : int
@export var HEALTH : int
@export var DAME : int 
@export var CRTDAM : int : set = _set_crtdame
@export var CRTRATE : int : set = _set_crtrate
@export var TYPE : _type
@export_category("Extra Category")
@export var STACKABLE : bool = false
@export var COMSUMABLE : bool = false
@export var IS_EQUIPED : bool = false
@export_multiline var DESCRIPTION : String
@export_range(1, 5) var STAR : int
@export var MAX_STACK : int = 60
@export_category("")
@export var ITEM : PackedScene

var Dame : int = 0
var health: int : get = _get_dame 

func _get_dame () :
	return DAME +1

func _init():
	print (DAME)
	print (health)

var temp_dame = 100

#setter 
func _set_crtdame(new_ctrdame) :
	CRTDAM = new_ctrdame
	Dame += ((Dame*CRTDAM)/100)

func _set_crtrate (new_crtrate) :
	CRTRATE = new_crtrate
	

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
			if IS_EQUIPED : 
				DameSauce.total_crt_rate +=CRTRATE
				DameSauce.total_dame += Dame
				ItemUse.__equip_item(self)
			elif IS_EQUIPED == false:
				DameSauce.total_crt_rate -=CRTRATE
				DameSauce.total_dame -= Dame
				ItemUse.__remove_equip(self)
