extends Spatial



var _has_launched := false
var _impulse := 0.0
var _angle_y := 0.0
var _angle_x := 0.0
var _rotation_speed := 10
var _direction := Vector3(90,0,0)

onready var _projectile := load("res://Projectile/Projectile.tscn")
onready var _reload_timer := get_node("ReloadTimer")
onready var _retical := get_node("Retical")


func _physics_process(_delta) -> void:
	
	_retical.global_rotation = _direction
	_prepare_launch()
	
	if not _has_launched and Input.is_action_just_pressed("shoot"):
		var new_projectile = _projectile.instance()
		add_child(new_projectile)
		_launch(new_projectile)
		_has_launched = true
		_reload_timer.start()


func _prepare_launch() -> void:
	_direction = _aim()
	_thrust()
	_limit_rotation()
	_limit_impulse()


func _aim() -> Vector3:
	_yaw()
	_pitch()
	return Vector3(-_angle_y, _angle_x, 0)


#Pitch and yaw are terms for rotating in 3D. Pitch is rotating along the x axis, Yaw is along the Y.
func _pitch() -> void:
	_angle_y += Input.get_axis("pitch_up", "pitch_down") / _rotation_speed


func _yaw() -> void:
	_angle_x += Input.get_axis("yaw_left", "yaw_right") / _rotation_speed
 

func _limit_rotation() -> void:
	if _angle_y > 3:
		 _angle_y = 3
	elif _angle_y < 0:
		_angle_y = 0

	if _angle_x > 1:
		 _angle_x = 1
	elif _angle_x < -1:
		_angle_x = -1


func _thrust() -> void:
	_impulse += Input.get_axis("thrust_up", "thrust_down") / 10


func _limit_impulse() -> void:
	if _impulse > 0:
		 _impulse = 0
	elif _impulse < -20:
		_impulse = -20


func _launch(new_projectile: RigidBody) -> void:
	var x_impulse :=  Vector3(0, 0, _impulse).rotated(Vector3.UP , _angle_x)
	var y_impulse := Vector3(0, 0, _impulse).rotated(Vector3.LEFT , (_angle_y - TAU/4))
	var new_impulse = x_impulse + y_impulse
	new_projectile.fire(new_impulse)


func _on_ReloadTimer_timeout() -> void:
	_has_launched = false

