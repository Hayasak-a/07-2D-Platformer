extends Actor


onready var stomp_area: Area2D = $StompArea2D

export var score: = 100


func _ready() -> void:
	scale.x*=1.3
	scale.y*=1.3
	get_node("Sprite").set_flip_h(true)
	set_physics_process(false)
	_velocity.x = -speed.x
	if(Global.lvl_one_gone != null):
		if(Global.get_curr_level()==1):
			if(Global.lvl_one_gone.find_last(get_name())==-1):
				pass
			else:
				queue_free()
		else:
			if(Global.lvl_two_gone.find_last(get_name())==-1):
				pass
			else:
				queue_free()

func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	if(_velocity.x>0):
		get_node("Sprite").set_flip_h(false)
	else:
		get_node("Sprite").set_flip_h(true)
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	PlayerData.score += score
	if(Global.get_curr_level()==1):
		Global.lvl_one_gone.append(get_name())
	else:
		Global.lvl_two_gone.append(get_name())
	queue_free()
