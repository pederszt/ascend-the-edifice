extends Node2D

var cards = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_card(card: Node2D) -> void:
	if cards.size() == 10:
		return;
	cards.append(card)
	add_child(card)
	set_positions()

func set_positions() -> void:
	var num_cards = cards.size()
	
	var start = 5 - floor(float(num_cards)/2.0)
	var ratio_step = (1.0/8.0)
	var rotate_step = (PI / 24)
	var half_rotate = rotate_step / 2.0
	
	if num_cards % 2 == 0:
		ratio_step = (1.0/9.0)
		start = 5 - floor(float(num_cards-1)/2.0)
	
	print(start," ",ratio_step)
	var ratio = ratio_step * start;
	var path = $HandPath/Follow
	
	var parent_pos = position
	
	var n = start;
	for card in cards:
		
		ratio = (n-1) * ratio_step
		
		path.set_progress_ratio(ratio)
		var position = path.position
		
		var rotate = 0
		
		if num_cards % 2 == 0:
			rotate = ((n-5) * rotate_step) - half_rotate
			
		else:
			rotate = (n-5) * rotate_step
		
		position.y = position.y + abs(n-5)*20.0
		
		card.set_default_rotation(rotate)
		
		card.set_target(position)
		card.set_text("Ratio: " + str(snappedf(ratio, 0.01))+ "\nRotate:" + str(snappedf(rotate, 0.01)))
		
		ratio += ratio_step
		n += 1
