extends Node2D

@export var scroll_speed:float = 3
func move():
	self.position.x -= scroll_speed
