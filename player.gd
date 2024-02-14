extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


const speed: int = 64

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
	#interact位置制御
	vecint(velocity)
	#なんかすごいやつ
	move_and_slide()
	
func vecint(_velocity:Vector2):
	print($Area2D/interact.transform.origin)
	if _velocity.y < 0 and _velocity.x == 0: 
		$Area2D/interact.transform.origin = Vector2(0,-9)
	if _velocity.y > 0 and _velocity.x == 0:
		$Area2D/interact.transform.origin = Vector2(0,10)
	if _velocity.x < 0:
		$Area2D/interact.transform.origin = Vector2(-7,0)
	if _velocity.x > 0:
		$Area2D/interact.transform.origin = Vector2(7,0)
	
func vecani(_velocity: Vector2):#アニメーション向き制御
	if _velocity.y < 0 and _velocity.x == 0: 
		$Sprite2D/AnimationPlayer.play("up")
	if _velocity.y > 0 and _velocity.x == 0:
		$Sprite2D/AnimationPlayer.play("down")
	if _velocity.x < 0:
		$Sprite2D/AnimationPlayer.play("left")
	if _velocity.x > 0:
		$Sprite2D/AnimationPlayer.play("right")
	
	
	
	
	
