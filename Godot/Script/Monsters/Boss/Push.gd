extends Area2D

func _on_Push_body_entered(body):
	body._on_HurtBox_area_entered(self)
