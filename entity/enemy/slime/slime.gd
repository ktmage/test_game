extends CharacterBody2D


func _ready():
	$Sprite2D/AnimationPlayer.play("idle")


func _physics_process(delta):
	velocity = $com_enemy_move_ai.get_movedirection() * 32
	#$com_enemy_move_ai.get_movedirection()
	move_and_slide()
