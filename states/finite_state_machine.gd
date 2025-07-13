extends Node 
class_name FiniteStateMachine 

@export var current_state: STATE

func _ready():
	_change_state(current_state)

func _change_state (new_state: STATE) :
	if current_state is STATE: 
		current_state._exit_state()
	new_state._enter_state()
	current_state = new_state
# todo : make it to send a signal 
#func _label_state (state):
	#if label: 
		#label.text = str(state)
	#else :
		#print ("bye")
