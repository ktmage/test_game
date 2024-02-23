extends State
class_name NonInteractableState

func _enter():
	pass
	
func _update(delta):
	pass
	
func _physics_update(delta):
	pass
	
func _exit():
	pass 

func _input_update(event):
	if event.is_action_pressed("interact") :
		print("I'm NonInteractableState.")
