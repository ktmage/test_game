extends Node
class_name State
## Stateの基底クラス
##
## オブジェクトの状態はStateとして表現されます。
## Stateを継承したクラスによって状態を定義します。
## _enter(), _update(), _physics_update(), _exit(), transitionedシグナルを宣言しない場合はアサーションされます。

## Stateに入る時に呼ばれるメソッド
func _enter() -> void:
	assert(false, "Class " + self.get_script().resource_path + " does not override method _enter.")
	return;
	
## _process()と同じタイミングで呼ばれるメソッド
func _update(delta: float) -> void:
	assert(false, "Class " + self.get_script().resource_path + " does not override method _update.")
	return;
	
## _physics_process()と同じタイミングで呼ばれるメソッド
func _physics_update(delta: float) -> void:
	assert(false, "Class " + self.get_script().resource_path + " does not override method _physics_update.")
	return;

## _input()と同じタイミングで呼ばれるメソッド
func _input_update(event: InputEvent) -> void:
	assert(false, "Class " + self.get_script().resource_path + " does not override method _input_update.")
	return;
	
## Stateから出る時に呼ばれるメソッド
func _exit() -> void:
	assert(false, "Class " + self.get_script().resource_path + " does not override method exit.")
	return;
