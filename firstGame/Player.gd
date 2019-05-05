extends KinematicBody

var speed = 600
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_pressed("ui_right"):
		direction.x +=1
	elif Input.is_action_pressed("ui_down"):
		direction.z += 1
	elif Input.is_action_pressed("ui_up"):
		direction.z -= 1
	direction = direction.normalized()
	direction = direction * speed * delta
	
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 12
	
	#Stores many collisions have happened since the last call to move_and_slide	
	var hitCount = get_slide_count()
	if hitCount > 0:
		var collision = get_slide_collision(0) #Returns a kinematic collision
		if collision.collider is RigidBody: #If colliding with the player
			collision.collider.apply_impulse(collision.position, -collision.normal) 
	