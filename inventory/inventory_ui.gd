extends Node

@onready var item_container = $Container/Panel/item_container
@export var inventory : INVENTORY

func _ready():
	if inventory :
		inventory._item_change.connect(self._update_inventory)
		ItemUse._reload.connect(self._update_inventory)
		ItemUse._add_item.connect(inventory._add_item)
		inventory._item_change.connect (inventory._make_item_unique)
		inventory._make_item_unique () 
		_update_inventory ()
	
# Called when the node enters the scene tree for the first time.
func _update_inventory ():
	for item_index in inventory.items.size ():
		_update_inventory_slot(item_index)

func _update_inventory_slot (item_indexs):
	var inventory_slot_display = item_container.get_child (item_indexs)
	var item = inventory.items [item_indexs]
	# call to slot 's function (not slot_base)
	inventory_slot_display._display_item (item)
	
