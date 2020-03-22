extends Control


onready var result: Label = $Result


func _ready() -> void:
	result.text = result.text % [Global.score, Global.deaths]
	PlayerData.reset()
