extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Player/AudioStreamPlayer2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_winmusic_body_entered(body: Node2D) -> void:
	audio_stream_player_2d.play()
