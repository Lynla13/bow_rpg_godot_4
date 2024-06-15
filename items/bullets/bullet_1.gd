extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var impulse_strength = 3000
	var angle = self.rotation
	self.apply_central_impulse(Vector2(cos(angle), sin(angle)) *  impulse_strength)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
