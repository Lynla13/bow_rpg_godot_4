extends VBoxContainer

@export var player_data : Resource

@onready var health = $Health
@onready var mana = $Mana
# Called when the node enters the scene tree for the first time.
func _ready():
	health.min_value = 0
	health.max_value = player_data.HEALTH
	mana.min_value = 0
	mana.max_value = player_data.MANA
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health.value = player_data.HEALTH
	mana.value = player_data.MANA
