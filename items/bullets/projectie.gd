extends Node2D



func _ready():
	Physiz._fire_arrow.connect(self._fire_base_arrow)


func _fire_base_arrow (_position, _rotation, power, type_arrow) :
	type_arrow = type_arrow.instantiate()
	self.add_child(type_arrow)
	type_arrow.show()
	type_arrow.position = _position
	type_arrow.rotation_degrees = _rotation
	var direction_vector = (get_global_mouse_position() - _position).normalized()
	DameControl.dame_direction = direction_vector
	type_arrow._fire_state(direction_vector*(power*10))

# make it fire any arrow type by call 
func _fire_heal_arrow (_position, _rotation, power):
	pass

func __fire_bomb_arrow (_position, _rotation, power):
	pass

func _fire_thunder_arrow (): 
	pass

func _fire_immobile_arrow ():
	pass



#enemy
