extends Node2D


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
	print("ready!!!!!!!!!!!!!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func grip_control(_chara_vector:int):
	if _chara_vector == 0:
		position = Vector2(grip_pos_up)
		rotation = deg_to_rad(grip_ang_up)
		z_index = 1
	if _chara_vector == 1:
		position = Vector2(grip_pos_down)
		rotation = deg_to_rad(grip_ang_down)
		z_index = 2
	if _chara_vector == 2:
		position = Vector2(grip_pos_left)
		rotation = deg_to_rad(grip_ang_left)
		z_index = 1
	if _chara_vector == 3:
		position = Vector2(grip_pos_right)
		rotation = deg_to_rad(grip_ang_right)
		z_index = 2
	else:
		pass
	
func action_control(_chara_vector: int):
	if _chara_vector == 0:
		position = Vector2(action_pos_up)
		rotation = deg_to_rad(action_ang_up)
		z_index = 1
	if _chara_vector == 1:
		position = Vector2(action_pos_down)
		rotation = deg_to_rad(action_ang_down)
		z_index = 2
	if _chara_vector == 2:
		position = Vector2(action_pos_left)
		rotation = deg_to_rad(action_ang_left)
		z_index = 1
	if _chara_vector == 3:
		position = Vector2(action_pos_right)
		rotation = deg_to_rad(action_ang_right)
		z_index = 2
	else:
		pass



