extends Control

@onready var menu: Control = $"."
var esc_count: int = 0
@onready var close_btn: Button = $close_btn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_key_pressed(KEY_E):
		#menu.show()
	if Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		 
		menu.show()
	
func _on_close_btn_button_down() -> void:
	menu.hide()
