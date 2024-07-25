extends Node2D

const base_arrow = preload("res://items/bullets/base_arrow/arrow_base.tscn")

func _ready():
	Physiz._fire_arrow.connect(self._fire_base_arrow)


func _fire_base_arrow (_position, _rotation, power) :
	var base_arrow = base_arrow.instantiate()
	self.add_child(base_arrow)
	base_arrow.show()
	base_arrow.position = _position
	base_arrow.rotation_degrees = _rotation
	var direction_vector = (get_global_mouse_position() - _position).normalized()
	base_arrow._fire_state(direction_vector*(power*10))
