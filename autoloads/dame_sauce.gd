extends Node

var player_data = preload("res://players/player.tres")
#Sauce of dame
#todo : finnish this file
#todo : finnish effect and state 
var dame 
var total_dame : int
var total_crt_rate : int

signal  sn_deal_dame (dame)  

func _deal_dame (target):
	target.emit_signal("_enemy_hurt")
	target.emit_signal("_target_dame", total_dame)
	

func _enemy_get_dame ():
	pass
	
func _player_get_dame () :
	pass

func _status () :
	pass
