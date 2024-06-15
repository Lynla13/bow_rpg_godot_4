extends Node

var item : ITEM
var player :PLAYER

signal _item_was_used ()
signal _reload ()
signal _use_item (item)
signal _equip_item (item)
signal _add_skill_to_slot (item)
signal _description_item (item)
signal _remove_equip (item)
signal _remove_item (item)
signal _fire ()

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
	pass
	emit_signal("_reload")

func __add_quickuse (_item) :
	emit_signal("_reload")
	
func __equip_item (_item) :
	if item is ITEM: 
		emit_signal("_equip_item", _item)
		emit_signal("_reload")

func __remove_equip (_item): 
	emit_signal("_remove_equip", _item)
	emit_signal("_reload")

func _fire_arrow () :
	emit_signal("fire")
