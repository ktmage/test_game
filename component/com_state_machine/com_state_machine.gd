extends Node
class_name com_state_machine
## StateMachineコンポーネント
##
## Stateという単位でオブジェクトの状態を表現するために、それぞれの状態の遷移を管理するコンポーネント。

## 初期化用のStateを保持するプロパティ
@export var initial_state : State

## 現在のStateを保持するプロパティ
var current_state : State

## ステートマシンの子に配置されたStateを保持するプロパティ
var states : Dictionary = {}

func _ready():
	assert(initial_state, "Initial state is not set.")
	if initial_state:
		initial_state._enter()
		current_state = initial_state

	for child in get_children():
		assert(child is State, "StateMachine can only have State as children.")
		if child is State:
			validate_transitioned_signal(child)
			states[child.name] = child
			child.transitioned.connect(_on_transitioned)

func _process(delta):
	if current_state:
		current_state._update(delta)

func _physics_process(delta):
	if current_state:
		current_state._physics_update(delta)

func _input(event: InputEvent):
	if current_state:
		current_state._input_update(event)

func _on_transitioned(state : State, new_state_name : String) -> void :
	if state != current_state:
		return;
		
	var new_state = states.get(new_state_name)
	if !new_state:
		return;
		
	if current_state:
		current_state._exit()
		
	new_state._enter()
		
	current_state = new_state;

# 基底クラス内で判定しようとするとオーバーライドされてしまう可能性があるのでここで検証する。
## Stateがtransitionedシグナルを実装しているか検証するためのメソッド。
func validate_transitioned_signal(state: State) -> void:
	assert(state.has_signal("transitioned"), "Class " + self.get_script().resource_path + " does not override signal transitioned.")
