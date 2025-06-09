extends Node2D

var circle_cnt = 21
var circle_step = (0.9/float(circle_cnt))
var circles = []
var offset = Vector2(25,25)
var textures = [
	load("res://circle-white.png"),
	load("res://circle.png")]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$ArrowPosition.z_index =100
	for i in range(0,circle_cnt):
		
		$ArrowPath/Follow.progress_ratio = i * circle_step
		var new_circle = $MousePosition.duplicate()
		new_circle.position = $ArrowPath/Follow.position
		add_child(new_circle)
		circles.append(new_circle)
		new_circle.show()
	
	$ArrowPath.curve.set_point_position(0,Vector2(0,0))
	$ArrowPath.curve.set_point_position(1,Vector2(0,320))
	
	print(0, 
	$ArrowPath.curve.get_point_position(0), 
	$ArrowPath.curve.get_point_in(0), 
	1,
	$ArrowPath.curve.get_point_position(1),
	$ArrowPath.curve.get_point_in(1) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var anchor_pos = $ArrowPath.curve.get_point_position(0)
	var target_pos = get_local_mouse_position()
	
	# move the target further to account for ??
	target_pos -= Vector2(190,190)
	
	# set the position of the visualization of where the mouse is
	$MousePosition.position = target_pos
	
	#set the end of the curve to the new target
	$ArrowPath.curve.set_point_position(1, target_pos)
	
	
	#set the point in for the last point to halfway between the two points
	#and reasonably high up
	var distance = (anchor_pos.x - target_pos.x)/2.0
	
	
	$ArrowPath.curve.set_point_in(1, Vector2(distance,-750))
	
	for i in range(0,circles.size()):
		var circle = circles.get(i)
		
		$ArrowPath/Follow.progress_ratio = i * circle_step
		circle.position = $ArrowPath/Follow.position
		circle.texture = textures[0]
		
	$ArrowPath/Follow.progress_ratio = 0.95
	$Arrowhead.position = $ArrowPath/Follow.position
	$ArrowPosition.position = $Arrowhead.position
	
	#print($Arrowhead.position.angle_to(target_pos))
	var rot = $Arrowhead.position.angle_to_point(target_pos)
	$Arrowhead.rotation = rot

func set_offset_x(text:String) -> void:
	offset.x = int(text)

func set_offset_y(text:String) -> void:
	offset.y = int(text)
