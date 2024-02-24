extends State
#class_name 

# 遷移したいときにemitするシグナル
signal transitioned(state : State, new_state_name : String)

# Stateに入る時に呼ばれるメソッド
func _enter():
_TS_pass

# _process()と同じタイミングで呼ばれるメソッド
func _update(delta: float):
_TS_pass

# _physics_process()と同じタイミングで呼ばれるメソッド
func _physics_update(delta: float):
_TS_pass

# _input()と同じタイミングで呼ばれるメソッド
func _input_update(event: InputEvent):
_TS_pass

# Stateから出る時に呼ばれるメソッド
func _exit():
_TS_pass 
