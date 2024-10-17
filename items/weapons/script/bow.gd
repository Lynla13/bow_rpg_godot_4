extends Node
class_name WEAPON_CONTROLLER

var smooth_mouse_pos : Vector2
@export var weapon : ITEM
@export var power = 40 
@onready var projectie = $projectie
@onready var isshot : bool = false
@onready var timer = $Timer
@onready var timer_2 = $Timer2
const base_arrow = preload("res://items/bullets/base_arrow/arrow_base.tscn")

# Called when the node enters the scene tree for the first time.

var is_weapon_used = false

func _use_weapon (rotation) :
	if isshot :
		_shot(rotation)
		isshot = false
		timer.start()
#	tween.parallel().tween_property(self,"scale",Vector2(1,4), player.jump_time_to_peak)

# first click fire the arrow
func _shot(rotation) :
	Physiz.__fire_arrow(projectie.global_position, rotation, power, base_arrow)


#seccond click use power
	
func _on_timer_timeout():
	isshot = true


func _on_start_timeout():
	isshot = true
