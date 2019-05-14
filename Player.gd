extends RigidBody

const MAX_SQUARED_VELOCITY = 100

onready var scoreLabel = get_node("/root/MiniGame/GUI/Score")

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func addPoints(nbPoints):
	score += nbPoints
	scoreLabel.text = str(score)

func _physics_process(delta):
	
	var force = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up") :
		force.z = -1
	elif Input.is_action_pressed("ui_down"):
		force.z = 1
		
	if Input.is_action_pressed("ui_left") :
		force.x = -1
	elif Input.is_action_pressed("ui_right"):
		force.x = 1
	
	if force == Vector3.ZERO:
		force = -linear_velocity / 2
	
	if linear_velocity.length_squared() < MAX_SQUARED_VELOCITY :
		add_force(force, transform.origin)