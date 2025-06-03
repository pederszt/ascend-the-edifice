extends Node2D

func _ready() -> void:
	var instantiate_card = Anger.instantiate()
	print(instantiate_card)
	print(instantiate_card.get_child_count())
	print(instantiate_card.mana_cost)
	$Hand.add_card(instantiate_card)
	
	$Hand.add_card(Anger.instantiate())
	$Hand.add_card(Anger.instantiate())
	$Hand.add_card(Anger.instantiate())
	$Hand.add_card(Anger.instantiate())
	$Hand.add_card(Anger.instantiate())
	$Hand.add_card(Anger.instantiate())
	


func _on_button_pressed() -> void:
	$Hand.add_card(Anger.instantiate()) # Replace with function body.
