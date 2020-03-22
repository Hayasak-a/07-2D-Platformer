extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 100
onready var global = get_node("/root/Global")


func _ready():
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
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	picked()


func picked() -> void:
	if(Global.score == null):
		Global.score = 0
	Global.score += score
	if(Global.get_curr_level()==1):
		Global.lvl_one_gone.append(get_name())
	else:
		Global.lvl_two_gone.append(get_name())
	anim_player.play("picked")
