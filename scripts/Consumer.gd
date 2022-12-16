extends Area2D

var start = false
onready var speed = get_parent().get_node("ParallaxBackground").floor_speed * 1.5
var rng = RandomNumberGenerator.new()
var my_random_number

func _ready():
	rng.randomize()
	my_random_number = rng.randf_range(2, 5)
	$AnimatedSprite.animation = String(round(my_random_number))



func _process(delta):
	if start:
		position += Vector2.LEFT * speed * delta


