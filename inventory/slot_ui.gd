extends Node

@onready var item_texture = $item_texture
@onready var item_quantity = $MarginContainer2/item_quantity
@onready var item_label = $MarginContainer/item_label
@onready var equip = $MarginContainer3/Equip
@onready var quick = $MarginContainer3/Quick
@onready var detele = $MarginContainer3/Detele
@onready var slot = $"."
var item_f : ITEM 

signal _get_item_index (index)

func _ready():
	slot.hide ()
	
	
func _display_item (item) :
	_button_config (item) 
	if item is ITEM :
		slot.show()
		item_texture.texture = item.TEXTURE
		item_label.text = str (item.NAME)
	if item.QUANTITY >=0 :
			item_quantity.show()
			item_quantity.text = str (item.QUANTITY)
	else :
		item_quantity.hide ()
	item_f = item
	
func _button_config (item) :
	if item.QUANTITY ==0 :	equip.hide ()
	else :	 equip.show ()


func _on_item_use():
	if item_f is ITEM and item_f != null: 
		item_f._is_use()
#		ItemUse._remove_item(item_f)
		#ItemUse._on_description_item (item_f) 
