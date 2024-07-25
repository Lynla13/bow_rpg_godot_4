extends Node

signal  _fire_arrow (position, direction, power)
signal _use_arrow_power ()

func __fire_arrow ( position : Vector2, rotate_degress : float, power: float):
	# send emit to projectie
	emit_signal("_fire_arrow",position,rotate_degress, power)

func __use_arrow_power () :
	emit_signal("_use_arrow_power")

func _teleoprt (destination) :
	pass
