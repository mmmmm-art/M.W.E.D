extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.set_window_fullscreen(true)
	$AnimationPlayer.play("Start_Up")
	if Global.secret:
		$Button2.visible = true
		$AnimationPlayer2.play("New_game")



func _on_Button2_pressed():
	Global.secret = false
	get_tree().change_scene("res://Scenes/Choose local.tscn")
