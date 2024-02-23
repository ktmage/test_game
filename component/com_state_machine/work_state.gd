extends State
class_name WorkState

var timer : Timer;

func _enter():
	print_rich("[color=yellow][b]WorkState: Enter![/b][/color]")
	print_rich("[color=yellow]WorkState: よし、やるぞ～！[/color]")	
	timer = Timer.new()
	self.add_child(timer)
	timer.timeout.connect(_on_timeout)
	timer.start(20.0)

func _update(delta: float):
	pass

func _physics_update(delta: float):
	pass

func _exit():
	print_rich("[color=yellow][b]WorkState: Exit![/b][/color]")	
	
func _on_timeout():
	timer.queue_free();
	print_rich("[color=yellow]WorkState: ...休憩しようかな。[/color]")		
	transitioned.emit(self, "IdleState")
