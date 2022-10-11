extends Spatial


signal score_updated(new_score)


var _score := 0


onready var _hud := find_node("HUD")
onready var _target := find_node("Target")


func _ready() -> void:
	# warning-ignore:return_value_discarded
	connect("score_updated", _hud, "_on_score_updated")
	# warning-ignore:return_value_discarded
	_target.connect("killed", self, "_on_target_killed")


func _on_target_killed() -> void:
	_score += 1
	emit_signal("score_updated", _score)
