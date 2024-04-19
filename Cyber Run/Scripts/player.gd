extends CharacterBody2D

var jump_force = 600  # Force applied when jumping
var gravity = 1200  # Gravity strength
const BOOSTCOOLDOWN:float = 2
var boostCooldown:float = BOOSTCOOLDOWN
var dead = false
var delay_time := 2.0
var scene_change_started = false
var anim: AnimatedSprite2D

func _ready():
	anim = $AnimatedSprite2D
	anim.play("Run")

func _physics_process(delta):
	if scene_change_started == true:
		delay_time -= delta
		if delay_time <= 0:
			# Change the scene
			get_tree().change_scene_to_file("res://scenes/UI/game-over.tscn")
			
	velocity.x = 0
	# Applying gravity
	if not is_on_floor():
		if Input.is_action_just_pressed("ui_up") && !dead:
			if velocity.y != 0 and boostCooldown < 0:
				boostCooldown = BOOSTCOOLDOWN
				rocketBoost()
		elif boostCooldown < 1 && !dead:
			anim.play("Fall")
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_up") && !dead:
			velocity.y = -jump_force
		else:
			if anim.animation != "Run" && !dead:
				anim.play("Run")
	move_and_slide() # Move the character using built-in method

func _process(delta):
	boostCooldown -= delta
	#print("Velocity: ", velocity.y)
	print("Cooldown: ", boostCooldown)

func rocketBoost() :
	if (!dead):
		anim.play("Boost")
		velocity.y -= jump_force
		boostCooldown = BOOSTCOOLDOWN

func _on_area_2d_body_entered(body):
	if body.is_in_group("obstacle") && !dead:
		dead = true
		anim.stop()
		anim.play("Dead")
		# Start the delay countdown
		scene_change_started = true
		Globals.lastScore = Globals.currentScore
