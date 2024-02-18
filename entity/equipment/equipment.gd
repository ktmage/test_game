extends Sprite2D

@export_category("status")
@export var attack: int
@export var defense: int 
@export_category("grip_position")
@export_group("grip_pos")
@export var grip_pos_up: Vector2
@export var grip_ang_up: int
@export var grip_pos_down: Vector2
@export var grip_ang_down: int
@export var grip_pos_left: Vector2
@export var grip_ang_left: int
@export var grip_pos_right: Vector2
@export var grip_ang_right: int
@export_group("action_pos")
@export var action_pos_up: Vector2
@export var action_ang_up: int
@export var action_pos_down: Vector2
@export var action_ang_down: int
@export var action_pos_left: Vector2
@export var action_ang_left: int
@export var action_pos_right: Vector2
@export var action_ang_right: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func grip_control(vec: String):
	if vec == "up":
		position = Vector2(grip_pos_up)
		rotation = grip_ang_up
		z_index = 1
	if vec == "down":
		position = Vector2(grip_pos_down)
		rotation = grip_ang_down
		z_index = 2
	if vec == "left":
		position = Vector2(grip_pos_left)
		rotation = grip_ang_left
		z_index = 1
	if vec == "right":
		position = Vector2(grip_pos_right)
		rotation = grip_ang_right
		z_index = 2
	else:
		pass
	
func action_control(vec: String):
	if vec == "up":
		position = Vector2(action_pos_up)
		rotation = action_ang_up
		z_index = 1
	if vec == "down":
		position = Vector2(action_pos_down)
		rotation = action_ang_down
		z_index = 2
	if vec == "left":
		position = Vector2(action_pos_left)
		rotation = action_ang_left
		z_index = 1
	if vec == "right":
		position = Vector2(action_pos_right)
		rotation = action_ang_right
		z_index = 2
	else:
		pass
