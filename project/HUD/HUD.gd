extends Control


onready var _score_label := find_node("ScoreLabel")


func _on_score_updated(score: int) -> void:
	_score_label.text = "SCORE: %d" % score
