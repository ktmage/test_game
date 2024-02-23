extends Area2D
class_name com_interact_area;

@export var com_selectable: com_selectable;
var is_entered: bool = false

signal interacted;

func _on_body_entered(body):
	is_entered = true

func _on_body_exited(body):
	is_entered = false

func _input(event):
	if event.is_action_pressed("interact") and is_entered and com_selectable.is_selected:
		emit_signal("interacted")
