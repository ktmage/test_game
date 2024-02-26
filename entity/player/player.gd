extends CharacterBody2D


const speed: int = 64
var chara_vector : int #キャラの向きを0~3で記憶(上下左右)
var chara_condition :String #キャラの状態を記憶

# Called when the node enters the scene tree for the first time.
func _ready():
	$chara_texture/AnimationPlayer.play("down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	#操作からvelocityに反映
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	#斜め速度を補正
	if velocity.length() > 0:
		velocity = velocity.normalized()
		
	#スピードを乗算
	velocity *= speed
	
	#chara_vectorを代入
	vector_ctrl(velocity)
	
	#アニメーション制御
	move_anim(chara_vector,chara_condition)
	
	
	

	#なんかすごいやつ
	move_and_slide()
	
	if chara_condition == "moving" or chara_condition == "idle":
		$com_equipment_position.direction_chenge(chara_vector)
	
func vector_ctrl(_velocity):
	if chara_condition != "action":
		if _velocity.y < 0 and _velocity.x == 0: 
			chara_vector = 0
			chara_condition = "moving"
		if _velocity.y > 0 and _velocity.x == 0:
			chara_vector = 1
			chara_condition = "moving"
		if _velocity.x < 0:
			chara_vector = 2
			chara_condition = "moving"
		if _velocity.x > 0:
			chara_vector = 3
			chara_condition = "moving"
		if _velocity.x == 0 and _velocity.y == 0:
			chara_condition = "idle"
		else:
			pass
	
func move_anim(_chara_vector: int, _chara_condition: String):#アニメーション向き制御
	if _chara_condition == "moving":
		if _chara_vector == 0:
			$chara_texture/AnimationPlayer.play("up")
		if _chara_vector == 1:
			$chara_texture/AnimationPlayer.play("down")
		if _chara_vector == 2:
			$chara_texture/AnimationPlayer.play("left")
		if _chara_vector == 3:
			$chara_texture/AnimationPlayer.play("right")
		
	if _chara_condition == "idle":
		$chara_texture/AnimationPlayer.stop()
		if _chara_vector == 0:
			$chara_texture.frame = 1
		if _chara_vector == 1:
			$chara_texture.frame = 0
		if _chara_vector == 2:
			$chara_texture.frame = 2
		if _chara_vector == 3:
			$chara_texture.frame = 3
			
	if _chara_condition == "action":
		$chara_texture/AnimationPlayer.stop()
		if _chara_vector == 0:
			$chara_texture.frame = 13
		if _chara_vector == 1:
			$chara_texture.frame = 12
		if _chara_vector == 2:
			$chara_texture.frame = 14
		if _chara_vector == 3:
			$chara_texture.frame = 15
	else:
		pass
	
	
func action():#武器を使う(?)
		chara_condition = "action"
		$com_equipment_position.action(chara_vector)
		var timer = get_tree().create_timer(0.5)
		timer.connect("timeout", func(): chara_condition = "idle")

func _input(event):
	if event.is_action_pressed("interact"):
		print("click!")
		action()




