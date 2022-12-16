extends ParallaxBackground

export var playing = false
export var cloud_speed = 200
export var floor_speed = 800
var delta = 0.001
var red = 0
var blue = 255

func _physics_process(delta):
	$ColorRect.color = Color8(red, 125, blue, 255)
	if(playing) :
		$clouds.motion_offset += Vector2.LEFT * cloud_speed * delta
		$Floor.motion_offset += Vector2.LEFT * floor_speed * delta
		red += 0.282222222
		blue -= 0.282222222
