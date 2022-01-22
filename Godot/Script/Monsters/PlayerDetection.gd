extends Area2D


var player = null


func can_see():
	return player != null

func _on_PlayerDetection_body_entered(body):
	player = body
	print("target found")
	print(player)

func _on_PlayerDetection_body_exited(body):
	print("Target lost")
	print(body)
	player = null
