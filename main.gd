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
	$Hand.add_card(card.instantiate())
	


func _on_add_x_text_changed() -> void:
	$TargetArrow.set_offset_x($AddX.text)


func _on_add_y_text_changed() -> void:
	$TargetArrow.set_offset_y($AddY.text)
