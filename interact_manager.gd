extends Node

@onready var player = get_tree().get_first_node_in_group("player")

const base_text = "[E] to "

var active_areas = []
var can_interact = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	
func  unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	# 配列に存在した場合の処理。
	if index != -1:
		active_areas.remove_at(index)
	
func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			await active_areas[0].interact.call();
			can_interact = true
