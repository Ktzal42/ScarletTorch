extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var death: bool = false
	

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const JUMP1_VELOCITY = -100

func die():
	death = true
	animated_sprite_2d.play("die")
	
	if death == true:
		print("died")
		

func _physics_process(delta: float) -> void:
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED 
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#flip character
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	#char anim.s
	if direction ==0 and death == false:
		animated_sprite_2d.play("idle")
	if direction !=0 and death == false:
		animated_sprite_2d.play("run")
		#dying animation connected with killzone
		


	

			



	move_and_slide()
