extends Spatial


signal score_updated(new_score)
signal finished


var _score := 0
var _winning_score := 1


onready var _main_menu := load("res://MainMenu/MainMenu.tscn")
onready var _hud := find_node("HUD")
onready var _target := find_node("Target")


func _ready() -> void:
	# warning-ignore:return_value_discarded
	connect("score_updated", _hud, "_on_score_updated")
	# warning-ignore:return_value_discarded
	connect("finished", _hud, "_on_finished")
	# warning-ignore:return_value_discarded
	_target.connect("killed", self, "_on_target_killed")
	# warning-ignore:return_value_discarded
	_hud.connect("restarted", self, "_on_restarted")


func _on_target_killed() -> void:
	_score += 1
	emit_signal("score_updated", _score)
	if _score == _winning_score:
		emit_signal("finished")


func _on_restarted() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(_main_menu)
