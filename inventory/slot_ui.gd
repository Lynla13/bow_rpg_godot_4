extends Node

@onready var item_texture = $item_texture
@onready var item_quantity = $MarginContainer2/item_quantity
@onready var equip = $MarginContainer3/Equip
@onready var slot = $"."
var item_f : ITEM 
@onready var item_equiped = $item_equiped

signal _get_item_index (index)

func _ready():
	item_equiped.hide()
	slot.hide ()
	
	
func _display_item (item) :
	_button_config (item) 
	if item is ITEM :
		slot.show()
		item_texture.texture = item.TEXTURE
	if item.QUANTITY >=0 :
			item_quantity.show()
			if item.TYPE >= 1 :
				item_quantity.hide()
	item_f = item
	
func _button_config (item) :
	if item.QUANTITY ==0 && item.TYPE == 0:
			equip.hide ()
			item_texture.modulate = "7c7c7c9d"
	else :
			equip.show ()
			item_texture.modulate = "ffffff"


func _on_item_use():
	if item_f is ITEM and item_f != null: 
		item_f._is_use()
		if item_f.IS_EQUIPED :	item_equiped.show()
		elif !item_f.IS_EQUIPED:	item_equiped.hide ()
#		ItemUse._remove_item(item_f)
		#ItemUse._on_description_item (item_f) 
