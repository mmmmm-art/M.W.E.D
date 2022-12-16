extends Node2D


# Declare member variables here. Examples:
# var a = 2
var my_random_number
var rng = RandomNumberGenerator.new()
var done = false
func _ready():
	$AnimationPlayer.play("Start")
	rng.randomize()
	my_random_number = round(rng.randf_range(1000, 5000))


func _on_Button_pressed():
	if(done):
		return
	$ColorRect/RichTextLabel.text = "$" + String(my_random_number)
	$ColorRect/AnimationPlayer.play("random number")
	Global.Balance = my_random_number
	done = true



func sceneChange():
	get_tree().change_scene("res://Scenes/Location.tscn")
