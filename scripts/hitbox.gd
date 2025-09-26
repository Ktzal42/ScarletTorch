class_name myhitbox
extends Area2D
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@export var damage := 10

func _init() -> void:
	collision_layer = 4
	collision_mask = 0


func _on_area_entered(area: Area2D) -> void:
	animation_player.play("swing")
