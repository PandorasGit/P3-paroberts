extends RigidBody


func fire(impulse: Vector3) -> void:
	apply_impulse(Vector3.ZERO, impulse)
