extends Area2D
class_name com_interact_area;

var is_entered: bool = false

func _on_body_entered(body):
	is_entered = true

func _on_body_exited(body):
	is_entered = false
