extends Node2D

@onready var dame_t = $Dame
@onready var crit_dame = $Crit_dame
@onready var miss = $Miss

# Called when the node enters the scene tree for the first time.
func _ready():
	dame_t.hide()
	crit_dame.hide()
	miss.hide()
	Physiz._show_dame.connect(self._dame_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _dame_text (dame, target) :
	dame_t.position.x = randf_range(target.position.x-50, target.position.x +50)
	dame_t.position.y = randf_range(target.position.y -180, target.position.y -210)
	dame_t.text = str (dame)
	dame_t.show()
	await get_tree().create_timer(0.4).timeout
	dame_t.hide()
	print ("dame", "dame", dame)
