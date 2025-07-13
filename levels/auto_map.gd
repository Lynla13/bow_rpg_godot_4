extends Node2D

@export var quantity: int = 10
@export var first_block : PackedScene
@onready var ground = $Equip_for_level/Ground
var x : int = 0
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if player is PackedScene:        
		var player_ = player
		var player_in = player_.instantiate()
		add_child(player_in)
		player_in.global_position = Vector2 (-100, 70)
		
func _create_a_map (quantity: int) :
	for i in range(0, 100):
		if first_block is PackedScene:
			var block_ = first_block
			var blck_intance = block_.instantiate()
			ground.add_child(blck_intance)
			x += 64
			blck_intance.global_position = Vector2 (x, -65)

func _on_button_pressed():
	_create_a_map (1)
