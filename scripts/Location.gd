extends Node

var gasprice
var rent
var wage

func _ready():
	$AnimationPlayer.play("pick")
	if Global.secret:
		$Secret.visible = false
		$Button8.visible = true



func _on_Button_pressed():
	Global.wage = 13.65
	Global.rent = 1335
	Global.gas = 2.976
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button2_pressed():
	Global.wage = 7.25
	Global.rent = 811
	Global.gas = 2.90
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button3_pressed():
	Global.wage = 15.50
	Global.rent = 1586
	Global.gas = 4.52
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button4_pressed():
	Global.wage = 11.00
	Global.rent = 1218
	Global.gas = 3.14
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button5_pressed():
	Global.wage = 7.25
	Global.rent = 887
	Global.gas = 3.78
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button6_pressed():
	Global.wage = 7.25
	Global.rent = 863
	Global.gas = 2.89
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button7_pressed():
	Global.wage = 7.25
	Global.rent = 1082
	Global.gas = 2.69
	get_tree().change_scene("res://Scenes/Apartment.tscn")


func _on_Button8_pressed():
	Global.wage = 16.56
	Global.rent = 1335
	Global.gas = 2.976
	get_tree().change_scene("res://Scenes/Apartment.tscn")
