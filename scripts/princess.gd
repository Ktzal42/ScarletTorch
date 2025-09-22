extends Area2D

@onready var winsound: AudioStreamPlayer2D = $winsound

func _on_body_entered(body: Node2D) -> void:
		winsound.play()
		get_tree().change_scene_to_file("res://scenes/winscreen.tscn")
		
