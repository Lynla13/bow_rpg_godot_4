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
	for i in range(0, items.size()):
		#check if dupplicate items
		if items[i] is ITEM and items[i].NAME == item.NAME and item.TYPE <=1 : 
			items [i].QUANTITY += 1
			break
		elif item.TYPE >= 2 :
			items.insert(0, item)
			break
		elif items[i] == null and item.TYPE <=1 and _add_item_slot () == 1 :
			items [i] = item
		else :
				emit_signal("_out_of_slot")
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
