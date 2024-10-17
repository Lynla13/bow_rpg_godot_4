extends Control

@onready var crit: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Crit
@onready var name_item: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Name
@onready var attack: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Attack
@onready var knockback: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Knockback
@onready var health: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Health
@onready var effects: RichTextLabel = $Panel/MarginContainer/VBoxContainer/Effects

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
