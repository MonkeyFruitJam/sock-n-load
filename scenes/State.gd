extends Node2D
class_name State

@onready var debug_label = owner.find_child("DebugLabel")
@onready var debug_player = owner.get_parent().find_child("TestPlayer")

signal transitioned # this signal will help us move between states

func enter():
	debug_label.text = name

func exit():
	pass

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass
