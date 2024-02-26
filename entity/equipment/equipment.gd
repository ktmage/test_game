extends Sprite2D
class_name equipment

@export_category("status")
@export var attack: int
@export var defense: int 

@export_category("grip_pos")
@export var grip_pos: Vector2
@export var grip_ang: int


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready!!!!!!!!!!!!!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	




