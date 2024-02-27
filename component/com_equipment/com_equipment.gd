extends Node2D
class_name com_equipment

@export var inst_main_equipment: PackedScene
@export var inst_sub_equipment: PackedScene

@export_category("main_hand_position")
@export_group("idle_pos")
@export var grip_main_up: Vector2
@export var grip_main_down: Vector2
@export var grip_main_left: Vector2
@export var grip_main_right: Vector2
@export_group("action_pos")
@export var action_grip_up: Vector2
@export var action_grip_down: Vector2
@export var action_grip_left: Vector2
@export var action_grip_right: Vector2
@export_category("sub_hand_position")
@export_group("idle_pos")
@export var grip_sub_up: Vector2
@export var grip_sub_down: Vector2
@export var grip_sub_left: Vector2
@export var grip_sub_right: Vector2
var main_equipment: Sprite2D
var sub_equipment: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_equipment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func set_equipment() -> void:
	if inst_main_equipment:
		main_equipment = inst_main_equipment.instantiate()
		$main_hand.add_child(main_equipment)
		$main_hand.position = Vector2(10,1)
	if inst_sub_equipment:
		sub_equipment = inst_sub_equipment.instantiate()
		$sub_hand.add_child(sub_equipment)
		$sub_hand.position = Vector2(-10,1)


func direction_chenge(facing: int) -> void:
	$main_hand.rotation = deg_to_rad(0)
	if facing == 0:
		$main_hand.position = grip_main_up
		$main_hand.z_index = 0
		$sub_hand.position = grip_sub_up
		$sub_hand.z_index = 0
	if facing == 1:
		$main_hand.position = grip_main_down
		$main_hand.z_index = 2
		$sub_hand.position = grip_sub_down
		$sub_hand.z_index = 2
	if facing == 2:
		$main_hand.position = grip_main_left
		$main_hand.z_index = 0
		$sub_hand.position = grip_sub_left
		$sub_hand.z_index = 2
	if facing == 3:
		$main_hand.position = grip_main_right
		$main_hand.z_index = 2
		$sub_hand.position = grip_sub_right
		$sub_hand.z_index = 0
	else:
		pass

func action(facing: int) -> void:
	
	if facing == 0:
		$main_hand.position = action_grip_up
		$main_hand.z_index = 0
		$main_hand.rotation = deg_to_rad(0)
	if facing == 1:
		$main_hand.position = action_grip_down
		$main_hand.z_index = 2
		$main_hand.rotation = deg_to_rad(180)
	if facing == 2:
		$main_hand.position = action_grip_left
		$main_hand.z_index = 0
		$main_hand.rotation = deg_to_rad(270)
	if facing == 3:
		$main_hand.position = action_grip_right
		$main_hand.z_index = 2
		$main_hand.rotation = deg_to_rad(90)
	else:
		pass



































