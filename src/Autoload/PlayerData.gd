extends Node


signal updated
signal died
signal reset

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths


func reset():
	Global.score = 0
	Global.deaths = 0
	Global.lvl_one_gone = [ "" ]
	Global.lvl_two_gone = [ "" ]
	Global.load_pos = false
	Global.save_data(null, null)
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	
	Global.deaths = new_value
	emit_signal("died")
