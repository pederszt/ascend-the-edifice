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
	c.set_card_name( "Strike" if rand % 2 == 0 else "Defend")
	$Hand.add_card(c)
	$TargetArrow.set_active(!$TargetArrow.active)

func _on_add_x_text_changed() -> void:
	$Hand.set_nudge_px(float($AddX.text))
	$Hand.set_positions()


func _on_add_y_text_changed() -> void:
	$Hand.set_rotate(float($AddY.text))
	$Hand.set_positions()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("_on_area_2d_area_entere: ", area.card_name, " ", area.targeted)
	


func _on_play_area_exited(area: Area2D) -> void:
	print("_on_area_2d_area_exited: ", area.card_name, " ", area.targeted)
	
