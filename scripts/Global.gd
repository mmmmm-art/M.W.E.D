extends Node

var Balance = 0
var food = 900
var health = 900
var week = 1
var day = 1
var month = 1
var secret = false
var wage = 0
var gas = 0
var rent = 0

func GameOver():
	Balance = 0
	food = 900
	health = 900
	week = 1
	day = 1
	month = 1
	secret = true
	wage = 0
	gas = 0
	rent = 0
	get_tree().change_scene("res://Scenes/StartPage.tscn")
