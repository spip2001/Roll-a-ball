extends Camera

# référence sur le joueur
onready var player = get_node("../Player")
# décalage de la caméra par rapport au joueur
var offset

func _ready():
	offset = translation - player.translation

func _physics_process(delta):
	translation = player.translation + offset
	
