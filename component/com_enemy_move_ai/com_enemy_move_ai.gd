extends Area2D

@export var detection_range: int = 32
@export var obstacle_range: int = 16

var eight_direction_vector: Array[Vector2] = [Vector2(0,-1),Vector2(1,-1),Vector2(1,0),Vector2(1,1),Vector2(0,1),Vector2(-1,1),Vector2(-1,0),Vector2(-1,-1)] 

@onready var parent: CharacterBody2D = get_parent()	#CharacterBody2D以外が今後入るかもしれない
@onready var rays: Array = get_node("rays").get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	#detection_rangeの適用
	print("えーっと、",get_parent().name," のdetection_rangeは... ",detection_range," ね！設定したよ！")
	$CollisionShape2D.shape.radius = float(detection_range)
	#obstacle_rageの適用
	for ray in rays:
		ray.target_position.y = float(obstacle_range)
		print(ray.name,"...",ray.target_position)
	
	#eight_direction_vectorの正規化
	for i in range(len(eight_direction_vector)):
		eight_direction_vector[i] = eight_direction_vector[i].normalized()
	print(eight_direction_vector)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_movedirection():
	return(move_direction(area_check()))


func area_check(): #範囲内にいるプレイヤーを返します。
	var bodies = get_overlapping_bodies()  # エリア内の物体を取得
	var closest_body = null  # 最も近い物体を保持するための変数
	var closest_dist = INF  # 最も近い距離を保持するための変数（初期値は無限大）
	
	for body in bodies:
		
		if body.is_in_group("enemy_target"):
			var dist = body.global_position.distance_to(global_position)  # エリアと各物体との距離を計算
			if dist < closest_dist:  # もし計算した距離が最も近い距離よりも短ければ
				closest_dist = dist  # 最も近い距離を更新
				closest_body = body  # 最も近い物体を更新
		else:
			pass
	
	if closest_body != null: #最短の物
		var target = closest_body
		#print(get_parent().name," が検知... ",closest_body.name)
		return(target)
	else:
		pass


func move_direction(target):
	var for_derection_vector: Vector2 #targetへの方向vector
	var interest_vector: Array[float] #進行方向決定に対するターゲット座標,周囲の障害物から算出する優先度
	var parent_position: Vector2 = parent.position #親の座標
	var target_position: Vector2 #ターゲットの座標
	
	if target != null: #targetがいる際の処理
		target_position = target.position
		
		#ターゲット方向を計算
		for_derection_vector.x =  target_position.x - parent_position.x
		for_derection_vector.y =  target_position.y - parent_position.y
		for_derection_vector = for_derection_vector.normalized() #ターゲット方向vectorを正規化
		#print(for_derection_vector)
		
		#周囲の障害物をから影響値配列を生成取得
		var obstacle: Array = obstacle_detection()
		#内積を計算,obstacle影響値を加算
		for i in range(len(eight_direction_vector)):
			#内積の計算
			var vec: Vector2 = eight_direction_vector[i] * for_derection_vector
			interest_vector.append(vec.x + vec.y)
			#障害物影響の加算
			interest_vector[i] += obstacle[i]
			
		
		#print(interest_vector)
		
		#関心度が最大の進行方向のvectorを返す
		var max_value = interest_vector[0]
		var max_index = 0
		for i in range(len(interest_vector)):
			if interest_vector[i] > max_value:
				max_value = interest_vector[i]
				max_index = i
		var result = eight_direction_vector[max_index]
		return(result) #進行方向を返す
		
	else:
		return(Vector2(0,0))


func obstacle_detection():
	var result: Array[int] = [0,0,0,0,0,0,0,0]
	var most_close: int = 5
	var middle_close: int = 2
	
	for i in range(len(rays)):
		if rays[i].get_collider() != null:
			result[i] -= most_close
			result[(i-1)%8] -= middle_close
			result[(i+1)%8] -= middle_close
	return(result)




