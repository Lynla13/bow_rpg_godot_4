extends Node

var player_data = preload("res://players/player.tres")
#Sauce of dame
#todo : finnish effect and state 
# this is place where control all the dame you will get and deal
# also all your status 

var weapon_dame : int =0
var top_dame: int =0
var hat_dame: int =0
var cape_dame: int=0
var bottom_dame: int=0
var total_dame : int =0

var weapon_crtdame : int = 0
var top_crtdame: int = 0
var hat_crtdame: int = 0
var cape_crtdame: int = 0
var bottom_crtdame: int = 0
var total_crtdame : int = 0


var weapon_knockback : int = 0
var top_knockback: int = 0
var hat_knockback: int = 0
var cape_knockback: int = 0
var bottom_knockback: int = 0
var total_knockback : int = 0


var weapon_def : int = 0
var top_def: int = 0
var hat_def: int = 0
var cape_def: int = 0
var bottom_def: int = 0
var total_def: int = 0


var weapon_health : int = 0
var top_health: int = 0
var hat_health: int = 0
var cape_health: int = 0
var bottom_health: int = 0
var total_health: int = 0

var weapon_speed : int = 0
var top_speed: int = 0
var hat_speed: int = 0
var cape_speed: int = 0
var bottom_speed: int = 0
var total_speed: int = 0

var is_crt = false
var base_crt = 100
var dame_direction
var is_equipment_change : bool = false

signal  sn_deal_dame (dame) 

func _dame_control_deal () :
	total_dame = weapon_dame + top_dame + hat_dame + cape_dame + bottom_dame
	total_crtdame = weapon_crtdame + top_crtdame + hat_crtdame + cape_crtdame + bottom_crtdame
	total_knockback = weapon_knockback + top_knockback + hat_knockback + cape_knockback + bottom_knockback
	total_health = weapon_health + top_health+ hat_health+ cape_health +bottom_health
	total_def = weapon_def + top_def + hat_def + cape_def + bottom_def
	#dont need yet
	#total_speed = weapon_speed+ top_speed+ hat_speed+ cape_speed +bottom_speed
	if is_crt :	 
		#caculate the dame deal
		var crit_dame_deal = ((total_crtdame+base_crt)*total_dame)/100
		print (crit_dame_deal)
		return crit_dame_deal
	else : 
		var normal_dame = total_dame
		print (normal_dame)
		return normal_dame
	
#todo : caculate def of enemy
func _deal_dame (target):
	print (target)
	target.emit_signal("_enemy_hurt")
	target.emit_signal("_target_dame", _dame_control_deal())
	

func _def (): 
	pass

func _enemy_get_dame ():
	pass
	
func _player_get_dame () :
	pass

func _status () :
	pass
