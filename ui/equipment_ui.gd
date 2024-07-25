extends Control

@onready var hat = $HSplitContainer/MarginContainer2/VBoxContainer/MarginContainer/hat
@onready var top = $HSplitContainer/MarginContainer2/VBoxContainer/MarginContainer2/top
@onready var bottom = $HSplitContainer/MarginContainer2/VBoxContainer/MarginContainer3/bottom
@onready var cape = $HSplitContainer/MarginContainer2/VBoxContainer/MarginContainer4/cape
@onready var weapon = $HSplitContainer/MarginContainer2/VBoxContainer/weapon/weapon

# Called when the node enters the scene tree for the first time.
#func _ready():
	#ItemUse._equip_item.connect(self._on_equip_item)

func _process(delta):
	_on_equip_item()

func _on_equip_item () :
	hat._display_item_texture (ItemUse.equipment[0])
	cape._display_item_texture (ItemUse.equipment[1])
	top._display_item_texture (ItemUse.equipment[2])
	bottom._display_item_texture (ItemUse.equipment[3])
	weapon._display_item_texture (ItemUse.equipment[4])
