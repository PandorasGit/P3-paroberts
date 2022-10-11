extends Spatial



var _has_launched := false
var _impulse := -50
var _angle_y := 0.0
var _angle_x := 0.0
var _rotation_speed := 10
var _velocity := Vector3(0, 0, _impulse)
var _direction := Vector3(90,0,0)

onready var projectile := load("res://Projectile/Projectile.tscn")
onready var _retical := get_node("Retical")


func _physics_process(_delta) -> void:
	_retical.global_rotation = _direction
	#set_rotation(_direction)
	_direction = _aim()
	
	if not _has_launched and Input.is_action_just_pressed("shoot"):
		var new_projectile = projectile.instance()
		add_child(new_projectile)
		var x_impulse :=  Vector3(0, 0, _impulse).rotated(Vector3.UP , _angle_x)
		var y_impulse := Vector3(0, 0, _impulse).rotated(Vector3.LEFT , (_angle_y - TAU/4))
		var new_impulse = x_impulse + y_impulse
		new_projectile.fire(new_impulse)
		_has_launched = true
	_has_launched = false

func _aim() -> Vector3:
	_yaw()
	_pitch()
	_limit_rotation()
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
