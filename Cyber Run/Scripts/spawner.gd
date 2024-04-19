extends Node2D

@export var scenes: Array[PackedScene] = []

func _on_timer_timeout():
	var e = scenes.pick_random().instantiate()
	e.global_position = Vector2(1200, randf_range(-250, 100))
	add_child(e)




