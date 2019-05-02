extends Area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_x(deg2rad(60 * delta))
	rotate_y(deg2rad(60 * delta))

#Called when a body enters the space of the cube
func _on_Cube_body_entered(body):
	if body is KinematicBody:
		queue_free() #Make the cube disappear only if the player touches it
