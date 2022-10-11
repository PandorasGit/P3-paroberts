extends RigidBody


func fire(impulse: Vector3) -> void:
	apply_impulse(Vector3.ZERO, impulse)


func _on_VisibilityNotifier_screen_exited():
	queue_free()


func _on_DespawnTimer_timeout():
	queue_free()
