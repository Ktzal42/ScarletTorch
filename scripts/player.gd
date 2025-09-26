extends CharacterBody2D

@onready var audio_stream_player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"	
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2


var death: bool = false
var raven = preload("res://scenes/raven.tscn")
var sword = preload("res://scenes/sword.tscn")
var yeah = preload("res://yeahihaveit.tscn")
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const JUMP1_VELOCITY = -100
var swordscene = sword.instantiate()
var yeahscene = yeah.instantiate()


func swordfree():
	timer.start()
	
func _on_timer_timeout() -> void:
	remove_child(swordscene)
	
#on death function
func die():
	death = true
	animated_sprite_2d.play("die")
	
	if death == true:
		print("died")
		audio_stream_player_2d.play()
		audio_stream_player.stop()
		
	#make raven scene appear when died
	var nheight= -7
	var nwidth= -14
	var ravenscene = raven.instantiate()
	ravenscene.position = Vector2(nwidth, nheight)
	add_child(ravenscene)
	
func _physics_process(delta: float) -> void:
	#when pressed esc it call title screen scene
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")		
	if Input.is_action_just_pressed("hit"):
		swordscene.position = Vector2(-7, 14)
		add_child(swordscene)
		swordscene.swing()
		swordfree()
		
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
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
