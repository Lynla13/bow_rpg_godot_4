extends Control


# Called when the node enters the scene tree for the first time.
@onready var texture = $MarginContainer/Texture

func _ready():
	texture.hide()

func _display_item_texture (item) :
	if item is ITEM :
		texture.show()
		texture.texture = item.TEXTURE
	else :
		texture.hide()

