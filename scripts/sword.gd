extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_ready() -> void:
	if Input.is_action_just_pressed("hit"):
		animation_player.play("swing")
	
