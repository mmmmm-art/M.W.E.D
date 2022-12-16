extends Node2D

var start = false
onready var speed = get_parent().get_node("ParallaxBackground").floor_speed
var rng = RandomNumberGenerator.new()
var my_random_number
var lenum = 0

func _ready():
	rng.randomize()
	my_random_number = rng.randf_range(1, 9)
	lenum = round(my_random_number)
	if(lenum == 1):
		$Sprite.region_rect = Rect2(206,16,35,46)
	elif(lenum == 2):
		$Sprite.region_rect = Rect2(243,12,17,50)
	elif(lenum == 3):
		$Sprite.region_rect = Rect2(262,27,23,35)
	elif(lenum == 4):
		$Sprite.region_rect = Rect2(287,13,16,49)
	elif(lenum == 5):
		$Sprite.region_rect = Rect2(305,32,23,30)
	elif(lenum == 6):
		$Sprite.region_rect = Rect2(330,22,21,40)
	elif(lenum == 7):
		$Sprite.region_rect = Rect2(373,17,28,45)
	elif(lenum == 8):
		$Sprite.region_rect = Rect2(403,32,60,30)
	elif(lenum == 9):
		$Sprite.region_rect = Rect2(465,36,29,26)



func _process(delta):
	if start:
		position += Vector2.LEFT * speed * delta
		

func collect(body):
	if body.name == "Player":
		body.Player_collect += 1
		queue_free()
