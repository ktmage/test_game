extends Node2D
class_name com_equipment_position

@export var inst_equipment: PackedScene

@export_category("hand_position")
@export_group("idle_pos")
@export var grip_pos_up: Vector2
@export var grip_pos_down: Vector2
@export var grip_pos_left: Vector2
@export var grip_pos_right: Vector2
@export_group("action_pos")
@export var action_pos_up: Vector2
@export var action_pos_down: Vector2
@export var action_pos_left: Vector2
@export var action_pos_right: Vector2

var equipment: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_equipment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func set_equipment() -> void:
	equipment = inst_equipment.instantiate()
	add_child(equipment)
	equipment.position = Vector2(10,1)


func direction_chenge(facing: int) -> void:
	rotation = deg_to_rad(0)
	if facing == 0:
		position = grip_pos_up
		z_index = 0
	if facing == 1:
		position = grip_pos_down
		z_index = 2
	if facing == 2:
		position = grip_pos_left
		z_index = 0
	if facing == 3:
		position = grip_pos_right
		z_index = 2
	else:
		pass

func action(facing: int) -> void:
	equipment.position = equipment.grip_pos
	if facing == 0:
		position = action_pos_up
		z_index = 0
		rotation = deg_to_rad(0)
	if facing == 1:
		position = action_pos_down
		z_index = 2
		rotation = deg_to_rad(180)
	if facing == 2:
		position = action_pos_left
		z_index = 0
		rotation = deg_to_rad(270)
	if facing == 3:
		position = action_pos_right
		z_index = 2
		rotation = deg_to_rad(90)
	else:
		pass



































