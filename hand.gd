class_name Hand
extends Node2D

var cards : Array[Card] = []

func _init():
	pass	

func add_card(card:Card) -> void:
	cards.append(card)
	card.scale.x = 0.3
	card.scale.y = 0.3
	add_child(card)
	arrange_cards()

func arrange_cards() -> void:
	var idx = 0;
	print(cards.size())
	for card in cards:
		var ratio = float(idx)/float(cards.size()-1)
		print(ratio)
		$CardPath/CardPathFollow.set_progress_ratio(ratio)
		var new_pos = $CardPath/CardPathFollow.position
		new_pos.y += 10
		card.set_default_position(new_pos)
		card.z_index = 10 + idx;
		idx = idx + 1	
