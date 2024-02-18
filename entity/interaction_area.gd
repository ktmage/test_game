extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass 
	
func _ready():
	print("interaction area ready!")

func _on_body_entered(body):
	print("registered!")
	InteractManager.register_area(self)


func _on_body_exited(body):
	print("unregistered!")
	InteractManager.unregister_area(self)
