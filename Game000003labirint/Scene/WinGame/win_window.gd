extends Node2D


func _ready():
	$Label.text = "Последнее время: " + $"/root/GameStats".timer
	$LabelLastLevelName.text = "Последний пройденый уровень: " + $"/root/GameStats".level
	if ($"/root/GameStats".i == 1):
		$"/root/GameStats".i = 2
	else:
		$lblYW.text = "Уровень пройден"

func _on_btn_restart_pressed():
	get_tree().change_scene_to_file("res://Scene/Level/level.tscn")


func _on_btn_level_2_pressed():
	get_tree().change_scene_to_file("res://Scene/Level2/level_2.tscn")


func _on_btn_level_3_pressed():
	get_tree().change_scene_to_file("res://Scene/Level3/level_3.tscn")


func _on_btn_level_4_pressed():
	get_tree().change_scene_to_file("res://Scene/Level4/level_4.tscn")


func _on_btn_level_5_pressed():
	get_tree().change_scene_to_file("res://Scene/Level5/level_5.tscn")


func _on_btn_level_6_pressed():
	get_tree().change_scene_to_file("res://Scene/Level6/level_6.tscn")
