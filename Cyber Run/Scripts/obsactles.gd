extends "scrollMovement.gd"

var anim: AnimatedSprite2D

func _physics_process(delta):
	move()

func _ready():
	anim = $AnimatedSprite2D
	anim.play("electric")
