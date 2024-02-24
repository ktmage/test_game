extends State
class_name InteractableState

@export var com_interact_area: com_interact_area;
@export var com_select_area: com_select_area;

signal interacted
signal transitioned

func _enter():
	pass
	
func _update(delta):
	pass
	
func _physics_update(delta):
	pass
	
func _exit():
	pass 
	
func _input_update(event):
	if event.is_action_pressed("interact") and com_interact_area.is_entered and com_select_area.is_selected :
		interacted.emit()
		transitioned.emit(self, "NonInteractableState")

