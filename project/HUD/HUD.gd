extends Control


signal restarted


onready var _score_label := find_node("ScoreLabel")
onready var _restart_button := find_node("RestartButton")
onready var _select_sound := find_node("SelectSound")
onready var _load_timer := find_node("LoadTimer")


func _on_score_updated(score: int) -> void:
	_score_label.text = "SCORE: %d" % score


func _on_finished() -> void:
	_restart_button.visible = true


func _on_RestartButton_pressed():
	_select_sound.play()
	_load_timer.start()


func _on_LoadTimer_timeout():
	emit_signal("restarted")
