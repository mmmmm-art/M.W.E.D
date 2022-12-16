extends Node2D


onready var heal = 900 - Global.health
var thing = false

func _ready():
	$AcceptDialog.dialog_text = "Pay:" + String(Global.rent)
	if Global.food >= heal:
		Global.food -= heal
		Global.health += heal
	else:
		Global.health += Global.food
		Global.food -= Global.food
	if Global.week == 4:
		Global.week = 1
		Global.month += 1
		$AcceptDialog.popup()
		thing = true

func _process(delta):
	if thing:
		if Input.is_action_pressed("Click"):
			_on_AcceptDialog_confirmed()
			thing = false
	$Day.text = "Day " + String(Global.day)
	$Week.text = "Week " + String(Global.week)
	$Month.text = "Month " + String(Global.month)
	$Balance.text = "Balance:" + String(Global.Balance)
	$Food/ColorRect2.set_size(Vector2(Global.food,64))
	$Health/ColorRect2.set_size(Vector2(Global.health,64))
	if Global.food > 900:
		Global.food = 900


func _on_Button2_pressed():
	if Global.Balance >= 80:
		if Global.health < 900:
			Global.Balance -= 80
			Global.health += 150
		if Global.food < 900 && Global.health == 900:
			Global.Balance -= 80
			Global.food += 150


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_AcceptDialog_confirmed():
	Global.Balance -= Global.rent
