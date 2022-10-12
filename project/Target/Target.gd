extends RigidBody


signal killed


func _on_VisibilityNotifier_screen_exited() -> void:
	emit_signal("killed")
	queue_free()
