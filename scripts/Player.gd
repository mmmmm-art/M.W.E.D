extends KinematicBody2D


var velocity = Vector2.ZERO
export var up_vel = 1250
var Jump_vel = Vector2.UP * up_vel
export var grav = 1750
var gravity = Vector2.DOWN * grav
var big_gravity = Vector2.DOWN * (grav * 4)
var start = false
var Player_collect = 0

func _process(delta):
	if start:
		if(Input.is_action_just_pressed("Jump") and is_on_floor()):
			velocity = Jump_vel
		if(!is_on_floor()):
			$AnimatedSprite.playing = false
			if Input.is_action_pressed("Down"):
				velocity += big_gravity * delta
			else:
				velocity += gravity * delta
		elif is_on_floor():
			$AnimatedSprite.playing = true
		move_and_slide(velocity, Vector2.UP)
