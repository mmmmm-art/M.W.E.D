extends Node2D

var start = false
var consumer_scene = preload("res://Scenes/Consumer.tscn")
var Trash_scene = preload("res://Scenes/Trash.tscn")
var rng = RandomNumberGenerator.new()
var Player_collect = 0
var trash_spawned = 0
var docked = 0
var wage = Global.wage * 40
var gas = Global.gas * 20
var total = 0
signal fuck
var stop = false
var thing = false


func _process(delta):
	if thing:
		if Input.is_action_pressed("Click"):
			_on_AcceptDialog_confirmed()
	if Global.health <= 0:
		stop = true
		$GameOver/AnimationPlayer.play("Game Over")
	Player_collect = $Player.Player_collect
	if Input.is_action_pressed("Click"):
		$Label2.visible = false
		start = true
	$Day.text = "Day " + String(Global.day)
	$Week.text = "Week " + String(Global.week)
	$Month.text = "Month " + String(Global.month)
	$Health/ColorRect2.set_size(Vector2(Global.health, 64))
	$Food/ColorRect2.set_size(Vector2(Global.food, 64))
	if start:
		$ParallaxBackground.playing = true
		$Player.start = true
		$Timer.start()
		$Timer2.start()
		$DayCalc.start()
		start = false
	if stop:
		$ParallaxBackground.playing = false
		$Player.start = false
		$Timer.paused = true
		$Timer2.paused = true
		$DayCalc.paused = true
	rng.randomize()
	$Timer.wait_time = rng.randf_range(0.5, 2)
	$Timer2.wait_time = rng.randf_range(0.5, 1)


func _on_Timer_timeout():
	Spawn_consumer()

func Spawn_consumer():
	var Consumer = consumer_scene.instance()
	Consumer.position = Vector2(1312, 576)
	Consumer.start = true
	Consumer.connect("body_entered", self, "hit")
	add_child(Consumer)

func Spawn_trash():
	var trash = Trash_scene.instance()
	trash.position = Vector2(1472, rng.randf_range(825, 850))
	trash.start = true
	trash.connect("body_entered", trash, "collect")
	trash_spawned += 1
	add_child(trash)



func _on_DayCalc_timeout():
	Global.day += 1
	$ParallaxBackground.red = 0
	$ParallaxBackground.blue = 255
	if Global.food <= 0:
		Global.health -= 150
	else:
		Global.food -= 75
	$DayCalc.start()
	if Global.day == 5:
		Global.day = 1
		stop = true
		docked = (trash_spawned - Player_collect) * Global.wage
		total = wage - docked - gas
		Global.week += 1
		$Label3.text = "Earnings: +$" + String(wage)
		$Label4.text = "Missed Trash: -$" + String(docked)
		$Label5.text = "Gas: -$" + String(gas)
		$Label7.text = "Total:" + String(total)
		$AcceptDialog.popup()
		$Label3.visible = true
		$Label4.visible = true
		$Label5.visible = true
		$Label7.visible = true
		$Payment_Player.play("Payment")
		thing = true

func hit(body):
	if body.name == "Player":
		Global.health -= 10
		$Payment_Player.play("hit")
	
	



func _on_Timer2_timeout():
	Spawn_trash()

func _on_AcceptDialog_confirmed():
	Global.Balance += total
	get_tree().change_scene("res://Scenes/Apartment.tscn")
	

func GameOver1():
	Global.GameOver()
	

func GameOver():
	$GameOver/Label2.text = "Score  Day: " + String(Global.day) + "  Week:  " + String(Global.week) + "  Month:  " + String(Global.month)
