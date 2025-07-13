extends Control

@onready var start: Button = $CanvasLayer/Start
@onready var cnt: Button = $CanvasLayer/Continue
@onready var setting: Button = $CanvasLayer/Setting
@onready var credit: Button = $CanvasLayer/Credit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/char_creation.tscn")


func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/credit_ui.tscn")
