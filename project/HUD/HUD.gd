extends Control


signal restarted


onready var _score_label := find_node("ScoreLabel")
onready var _restart_button := find_node("RestartButton")


func _on_score_updated(score: int) -> void:
	_score_label.text = "SCORE: %d" % score


func _on_finished() -> void:
	_restart_button.visible = true


func _on_RestartButton_pressed():
	emit_signal("restarted")
