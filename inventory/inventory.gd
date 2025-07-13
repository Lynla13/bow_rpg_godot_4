extends Resource
class_name INVENTORY

@export var items :Array[ITEM] = [null]

signal _item_change ()
#send add slot signal to list items
signal _add_slot ()
signal _out_of_slot ()

func _add_item_slot () :
	if items.size() < 60:
		items.append (null)
		return 1
	else :
		return 0

func _add_item (item: ITEM) :
	var count : int = 0
	for i in range(0, items.size()):
		#check if dupplicate items
		if items[i].NAME != item.NAME:
			count += 1
		elif item.TYPE == 0 and items[i].NAME == item.NAME: 
				items [i].QUANTITY += item.QUANTITY
		elif item.TYPE > 0 and item.TYPE <= 5 and items[i].NAME == item.NAME: 
				Utlize.broken_satr += 100
	if count == items.size() :
		items.append(item)
	emit_signal("_item_change")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _remove_item_from_inventory (item):
	#set item == null
	pass

func _sort_item () :
	# sort item : weapon and eqipment first, then item , then null
	pass

func _make_item_unique () :
	var unique_items :Array[ITEM] = []
	for item in items: 
		if  item is ITEM : 
			unique_items.append(item.duplicate())
		else :
			unique_items.append(null)
	items = unique_items
