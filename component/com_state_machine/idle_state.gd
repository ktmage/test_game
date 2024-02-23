extends State
class_name IdleState

var timer : Timer;

func _enter():
	print_rich("[color=green][b]IdleState: Enter![/b][/color]")
	print_rich("[color=green]IdleState: 10秒くらい休もうかな。[/color]")	
	
	timer = Timer.new()
	self.add_child(timer)
	timer.timeout.connect(_on_timeout)
	timer.start(10.0)

func _update(delta: float):
	pass

func _physics_update(delta: float):
	pass

func _exit():
	print_rich("[color=green][b]IdleState: Exit![/b][/color]")

func _on_timeout():
	timer.queue_free();
	print_rich("[color=green]IdleState: そろそろやるか…[/color]")
	transitioned.emit(self, "WorkState")
