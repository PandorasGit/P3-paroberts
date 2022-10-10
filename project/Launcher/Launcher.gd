extends Spatial


var _has_launched := false

onready var projectile := load("res://Projectile/Projectile.tscn")


func _physics_process(_delta):
	if not _has_launched and Input.is_action_just_pressed("shoot"):
		var new_projectile = projectile.instance()
		add_child(new_projectile)
		_has_launched = true
