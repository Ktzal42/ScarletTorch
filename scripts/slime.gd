extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_castright.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
		animated_sprite.play("default")
	if ray_castleft.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		animated_sprite.play("default")
	position.x += direction * SPEED * delta
func take_damage(amount: int) -> void:
	animated_sprite.play("damage")
	print("Damage ", amount)
		
		
func kill():
	queue_free()
