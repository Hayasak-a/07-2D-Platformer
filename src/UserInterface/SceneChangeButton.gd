tool
extends Button

var sc

export(String, FILE) var next_scene_path: = ""


func _on_button_up() -> void:
	sc = get_tree().get_current_scene()
	if(next_scene_path=="res://src/Levels/Level01.tscn"):
		Global.load_data()
		if(sc==get_tree().get_current_scene()):
			get_tree().change_scene(next_scene_path)
	else:
		get_tree().change_scene(next_scene_path)
		PlayerData.emit_signal("reset")
	


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_scene_path == "" else ""
