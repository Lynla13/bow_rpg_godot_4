extends Node

var player_data = preload("res://players/player.tres")
#Sauce of dame
#todo : finnish effect and state 
# this is place where control all the dame you will get and deal
# also all your status 

var total_dame : int
var total_crtdame : int
var total_knockback : int
var total_def : int
var is_crt = false
var base_crt = 100
var dame_direction


signal  sn_deal_dame (dame) 

func _dame_control_deal () :
	if is_crt :	 
	#caculate the dame deal
		var crit_dame_deal = ((total_crtdame+base_crt)*total_dame)
		return crit_dame_deal
	else : 
		var normal_dame = total_dame
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
