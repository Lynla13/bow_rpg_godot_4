extends Node
class_name WEAPON_CONTROLLER

@export var weapon : ITEM
var smooth_mouse_pos : Vector2
@onready var line_2d = $Line2D
@onready var ray_cast_2d = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _use_weapon () :
	ItemUse._fire_arrow()
	print ("haha")
#	tween.parallel().tween_property(self,"scale",Vector2(1,4), player.jump_time_to_peak)

func _stick_batch () :
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
