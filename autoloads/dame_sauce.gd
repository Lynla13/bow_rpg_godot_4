extends Node

var player_data = preload("res://players/player.tres")
#Sauce of dame
#todo : finnish this file
#todo : finnish effect and state 
var dame 

signal  sn_deal_dame (dame)  

func _deal_dame ():
	print (dame)
	emit_signal("sn_deal_dame", dame)
	
func _enemy_get_dame ():
	pass
	
func _player_get_dame () :
	pass

func _status () :
	pass
