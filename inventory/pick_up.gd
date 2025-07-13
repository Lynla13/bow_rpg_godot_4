extends CharacterBody2D
@onready var front_eye = $TextureRect/front_eye
@onready var back_eye = $TextureRect/back_eye
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var item : ITEM

func _process(delta):
	_gravity(delta)
	if front_eye.is_colliding() || back_eye.is_colliding():
		if front_eye.get_collider().get_collision_layer() == 1: 
			var player = front_eye.get_collider().get_parent()
			var velocity = global_position.direction_to(player.global_position)
			move_and_collide(velocity *70 * delta)
			if item is ITEM : 
				ItemUse.__add_item (item)
			queue_free()
	move_and_slide()
	#hack: tween this

func _gravity (delta) :
	if not is_on_floor():
		velocity.y += gravity * delta
