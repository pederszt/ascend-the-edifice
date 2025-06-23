extends Node2D

var t_pos = Vector2(0,0)

@export var card : PackedScene = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var c = card.instantiate()
	var rand = randi()
	
	c.set_targeted(rand % 2 == 0)
	c.set_card_name( "Strike" if rand % 2 == 1 else "Defend")
	c.set_mana_cost( rand % 3 )
	
	c.card_dropped.connect(_on_card_drop)
	
	$Hand.add_card(c)
	$TargetArrow.set_active(false)

func _on_add_x_text_changed() -> void:
	$Hand.set_nudge_px(float($AddX.text))
	$Hand.set_positions()


func _on_add_y_text_changed() -> void:
	$Hand.set_rotate(float($AddY.text))
	$Hand.set_positions()

func _on_area_2d_area_entered(card: Area2D) -> void:
	if card.targeted:
		#move card to central position and engage targeting arrow
		card.override_pos = Vector2(450,-50)
		$TargetArrow.set_active(true)
	else:
		$TargetArrow.set_active(false)
		print("playing card")
	
func _on_card_drop(card: Area2D) -> void:
	print("card_dropped")
	$TargetArrow.set_active(false)

func _on_play_area_exited(area: Area2D) -> void:
	print("_on_area_2d_area_exited: ", area.card_name, " ", area.targeted)
