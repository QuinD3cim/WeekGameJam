extends Area2D

export (String, FILE) var scene

func _on_LoadingZone_body_entered(body):
	if body.is_in_group("hero"):
		SceneChanger.change_scene(scene)
