extends Node2D

@onready var game_win = "res://Scene/WinGame/win_window.tscn"


func _on_area_2d_body_entered(body):
	if (body.name == "CharacterBody2D"):		
		$"/root/GameStats".level = "Уровень 4"
		get_tree().change_scene_to_file(game_win)
