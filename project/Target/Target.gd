extends RigidBody


signal killed


func _on_VisibilityNotifier_screen_exited():
	emit_signal("killed")
	queue_free()
