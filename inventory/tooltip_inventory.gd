extends Control

@onready var crit: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Crit
@onready var name_item: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Name
@onready var attack: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Attack
@onready var knockback: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Knockback
@onready var health: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Health
@onready var effects: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Effects
@onready var description: RichTextLabel = $ItemPopup/MarginContainer/VBoxContainer/Description
@onready var item_texture : TextureRect = $ItemPopup/MarginContainer/VBoxContainer/TextureRect

# Called when the node enters the scene tree for the first time.
func PopupContent (_item,_item_name, _crit, _attack,_knock_back, _health,_description):
	item_texture.texture = _item
	name_item.text = str(_item_name)
	health.text = "Health: "+str(_health)
	description.text = " "+str(_description)
	# set text color
	if _crit > 0 :
		crit.text = "Crit: +"+str(_crit)
		crit["theme_override_colors/default_color"] = Color(0.207,0.958,0)
		crit.show()
	elif _crit <0 :
		crit.text = "Crit: -"+str(_crit)
		crit["theme_override_colors/default_color"] = Color(0.82,0.031,0)
		crit.show()
	else:	crit.hide()
	#attack
	if _attack > 0 :
		attack.text = "Attack: +"+str(_attack)
		attack["theme_override_colors/default_color"] = Color(0.207,0.958,0)
		attack.show()
	elif _attack <0 :
		attack.text = "Attack: -"+str(_attack)
		attack["theme_override_colors/default_color"] = Color(0.82,0.031,0)
		attack.show()
	else:	attack.hide()
	#Knockback
	if _knock_back > 0 :
		knockback.text = "knockback: +"+str(_knock_back)
		knockback["theme_override_colors/default_color"] = Color(0.207,0.958,0)
		knockback.show()
	elif _knock_back <0 :
		knockback.text = "knockback: -"+str(_knock_back)
		knockback["theme_override_colors/default_color"] = Color(0.82,0.031,0)
		knockback.show()
	else:	knockback.hide()
	#Health
	if _health > 0 :
		health["theme_override_colors/default_color"] = Color(0.207,0.958,0)
		health.show()
	elif _health <0 :
		health["theme_override_colors/default_color"] = Color(0.82,0.031,0)
		health.show()
	else:	health.hide()
	#Description
	if _description != null :
		description.show()
	else:	description.hide()

func ItemPopup() :
	%ItemPopup.popup()

func HideItemPopup() :
	%ItemPopup.hide()