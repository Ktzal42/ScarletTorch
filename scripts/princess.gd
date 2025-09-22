extends Area2D

@onready var game_manager = %GameManager


func _on_body_entered(body: Node2D) -> void:
	if game_manager.score == 5:
		get_tree().change_scene_to_file("res://scenes/winscreen.tscn")
	else: 
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
			
		
