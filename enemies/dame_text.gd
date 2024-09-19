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


func _dame_text (dame, target) :
	if DameControl.is_crt :
		_normal_dame (crit_dame,dame,target)
	if !DameControl.is_crt :
		_normal_dame (dame_t,dame,target)
		
func _normal_dame (text,dame,target) :
	text.position.x = randf_range(target.position.x-100, target.position.x +100)
	text.position.y = randf_range(target.position.y -180, target.position.y -210)
	text.text = str (dame)
	text.show()
	await get_tree().create_timer(0.4).timeout
	text.hide()
