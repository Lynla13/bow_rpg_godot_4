extends Node

var item : ITEM
var player :PLAYER
var equipment :Array[ITEM] = [null,null,null,null,null] 
var value : int 
signal _item_was_used ()
signal _reload ()
signal _use_item (item)
signal _equip_item (item)
signal _add_skill_to_slot (item)
signal _description_item (item)
signal _remove_equip (item)
signal _remove_item (item)
signal _fire ()
signal _add_item (item)

#reload signal is connect with update inventory
#Connect to Player
# from player connect to fitem, inventory
func __use_item (_item) :
	emit_signal("_item_was_used")
	emit_signal("_reload")
	
#Connect to Player
# from player connect to inventory _remove_item function
func __remove_item (_item) :
	emit_signal("_remove_item", _item)
	emit_signal("_reload")

func __on_description_item (_item) :
	emit_signal("_description_item", _item)

func __remove_quickuse (_item) :
	emit_signal("_reload")

func __add_quickuse (_item) :
	emit_signal("_reload")
	
func __add_item (_item) :
	emit_signal("_add_item", _item)
	
func __equip_item (_item) :
	if _item is ITEM:
		var x = _item.TYPE
		match x :
			1: 	equipment[0] = _item
			2 :	equipment[1] = _item
			3 :	equipment[2] = _item
			4 :	equipment[3] = _item
			5 :	equipment[4] = _item
		emit_signal("_equip_item", _item)
		emit_signal("_reload")
