extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer

var value = 0
func control():
	if animation_player.is_playing():
		value += 5
	else:
		value -= 5

func swing():
		animation_player.play("swing")
	
