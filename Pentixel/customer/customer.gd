class_name Customer extends PathFollow3D

signal customer_arrived(customer)

@export var speed := 10.0

@onready var ray_cast_3d = $RayCast3D
@onready var sprite = $Sprite3D
@onready var debug_timer = $DebugTimer


func _physics_process(delta):
	sprite.look_at(owner.player.global_position)
	ray_cast_3d.force_raycast_update()
	if ray_cast_3d.is_colliding():
		return
	progress += speed * delta
	if progress_ratio == 1.0:
		customer_arrived.emit(self)
		print("customer arrived")
		debug_timer.start()
		set_physics_process(false)s


func _on_debug_timer_timeout():
	queue_free()
