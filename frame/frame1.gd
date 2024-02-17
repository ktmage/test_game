extends Node2D

var manager :CanvasLayer
signal S_click

# Called when the node enters the scene tree for the first time.
func _ready():
	manager = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	S_click.emit()
	print("click!")
