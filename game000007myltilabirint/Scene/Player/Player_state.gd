extends Node

class_name State

var player: Player
var state_machine: PlayerStateMachine

func _ready() -> void:
	pass

func enter():
	pass

func exit():
	pass

func process(delta):
	return self

func physics(delta):
	return self

func handle_input(event):
	return self
