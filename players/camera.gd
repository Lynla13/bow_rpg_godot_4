extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	offset.x = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if offset.x <= 300: 
		offset.x +=4
