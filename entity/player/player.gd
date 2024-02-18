extends CharacterBody2D

const SWORD = preload("res://entity/equipment/sword/sword.tscn")

const speed: int = 64
var equipment: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$chara_texture/AnimationPlayer.play("down")
	equip() #テスト用


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
	
	#アニメーション向き制御
	vecani(velocity)
	equip_contorol(velocity)

	#なんかすごいやつ
	move_and_slide()
	
func vecani(_velocity: Vector2):#アニメーション向き制御
	if _velocity.y < 0 and _velocity.x == 0: 
		$chara_texture/AnimationPlayer.play("up")
	if _velocity.y > 0 and _velocity.x == 0:
		$chara_texture/AnimationPlayer.play("down")
	if _velocity.x < 0:
		$chara_texture/AnimationPlayer.play("left")
	if _velocity.x > 0:
		$chara_texture/AnimationPlayer.play("right")
	
func equip():
	print("equip!")
	equipment = SWORD.instantiate()
	add_child(equipment)
	equip_contorol(velocity)
	
func equip_contorol(_velocity: Vector2):
	if equipment == null:
		pass
	else:
		if _velocity.y < 0 and _velocity.x == 0: 
			equipment.grip_control("up")
		if _velocity.y > 0 and _velocity.x == 0:
			equipment.grip_control("down")
		if _velocity.x < 0:
			equipment.grip_control("left")
		if _velocity.x > 0:
			equipment.grip_control("right")
	
	
	
	
	
