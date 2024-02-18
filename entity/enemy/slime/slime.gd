extends CharacterBody2D


func _ready():
	$Sprite2D/AnimationPlayer.play("idle")


func _physics_process(delta):

	move_and_slide()
