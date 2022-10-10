extends Spatial



var _has_launched := false

var _impulse :=  -10
var _velocity := Vector3(0, 0, _impulse)

onready var projectile := load("res://Projectile/Projectile.tscn")


func _physics_process(_delta) -> void:
	
	_velocity += _aim()
	print(_velocity)
	if not _has_launched and Input.is_action_just_pressed("shoot"):
		var new_projectile = projectile.instance()
		add_child(new_projectile)
		new_projectile.apply_impulse(Vector3.ZERO, _velocity)
		_has_launched = true
	_has_launched = false


func _aim() -> Vector3:
	var y_component := _pitch()
	var x_component := _yaw()
	return Vector3(x_component, -y_component, 0)

#Pitch and yaw are terms for rotating in 3D. Pitch is rotating along the x axis, Yaw is along the Y.
func _pitch() -> float:
	return Input.get_axis("pitch_up", "pitch_down")
	
func _yaw() -> float:
	return Input.get_axis("yaw_left", "yaw_right")
