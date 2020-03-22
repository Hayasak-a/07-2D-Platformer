extends Node2D
var score
var lvl_one_gone = [""]
var lvl_two_gone = [""]
var x
var y
var lives
var level
var deaths = 0
var load_pos = true
var save_path = "res://savegame.sav"
var config = ConfigFile.new()
var load_data = config.load(save_path)

func _ready():
	pass

func save_data(xs, ys):
	if(get_tree().get_current_scene().get_name() == "Level01"):
		config.set_value("Save", "level", 1)
	elif(get_tree().get_current_scene().get_name() == "Level02"):
		config.set_value("Save", "level", 2)
	config.set_value("Save","score",score)
	config.set_value("Save", "one_gone", lvl_one_gone)
	config.set_value("Save", "two_gone", lvl_two_gone)
	config.set_value("Save", "x", xs)
	config.set_value("Save", "y", ys)
	x = xs 
	y = ys
	if(lvl_one_gone==null):
		lvl_one_gone = [""]
		lvl_two_gone = [""]
	config.set_value("Save","lives",lives)
	config.set_value("Save", "deaths", deaths)
	config.save(save_path)
	
func load_data():
	score = config.get_value("Save","score")
	
	x = config.get_value("Save", "x")
	y = config.get_value("Save", "y")
	lives = config.get_value("Save","lives")
	deaths = config.get_value("Save", "deaths")
	lvl_one_gone = config.get_value("Save", "one_gone")
	lvl_two_gone = config.get_value("Save", "two_gone")
	level = config.get_value("Save", "level")
	load_pos = true
	if(level==1):
		get_tree().change_scene("res://src/Levels/Level01.tscn")
	elif(level==2):
		get_tree().change_scene("res://src/Levels/Level02.tscn")
	else:
		PlayerData.reset()
		get_tree().change_scene("res://src/Levels/Level01.tscn")
			
func get_curr_level():
	if(get_tree().get_current_scene().get_name() == "Level01"):
		return 1
	elif(get_tree().get_current_scene().get_name() == "Level02"):
		return 2
	return 0
	
