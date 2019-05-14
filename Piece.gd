extends Spatial

export(int) var valeur = 10

const vitesse_rotation = PI

func _process(delta):
	rotate_y(vitesse_rotation * delta)

func _on_Area_body_entered(body):
	if body.name == "Player" :
		body.addPoints(valeur)
		queue_free()
