extends Area2D
class_name com_selectable

var is_selected: bool = false;
var _material: ShaderMaterial;
@export var sprite_2d: Sprite2D;

func _init():
	_material = ShaderMaterial.new()
	_material.shader = load("res://component/com_select_area/highlight.gdshader")

func _ready():
	if sprite_2d != null:
		sprite_2d.material = _material
		_material.set_shader_parameter("highlight", 0)

func _on_mouse_entered():
	is_selected = true;
	_material.set_shader_parameter("highlight", 0.5)

func _on_mouse_exited():
	is_selected = false;
	_material.set_shader_parameter("highlight", 0)
