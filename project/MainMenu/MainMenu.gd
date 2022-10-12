extends Control


onready var _world := preload("res://World/World.tscn")
onready var _select_sound := find_node("SelectSound")
onready var _load_timer := find_node("LoadTimer")


func _on_StartButton_pressed() -> void:
	_select_sound.play()
	_load_timer.start()
	


func _on_Load_Timer_timeout() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(_world)
