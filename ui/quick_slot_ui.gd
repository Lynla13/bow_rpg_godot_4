extends Control


# Called when the node enters the scene tree for the first time.
@onready var texture = $MarginContainer/Texture
var item_f
func _ready():
	texture.hide()

func _display_item_texture (item) :
	if item is ITEM :
		texture.show()
		texture.texture = item.TEXTURE
	else :
		texture.hide()
	item_f = item



func _on_mouse_entered():
	if item_f is ITEM and item_f != null: 
		Popups.PopupContent(item_f.TEXTURE,item_f.NAME, item_f.CRTDAME, item_f.DAME, item_f.KNOCKBACK, item_f.HEALTH, item_f.DESCRIPTION)
		Popups.ItemPopup()



func _on_mouse_exited():
	Popups.HideItemPopup()
