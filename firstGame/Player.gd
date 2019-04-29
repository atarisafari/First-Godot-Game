extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var direction = Vector3()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_left"):
		direction.z += 1
	elif Input.is_action_pressed("ui_right"):
		direction.z -=1
	elif Input.is_action_pressed("ui_down"):
		direction.x += 1
	elif Input.is_action_pressed("ui_up"):
		direction.x -= 1
	direction = direction.normalized()
	direction = direction * speed * delta
	move_and_slide(direction, Vector3(0, 1, 0))