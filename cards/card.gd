extends Node2D

class_name Card
@export var mana_cost : int
@export var card_speed : int = 200
var card_name : String
var hovered : bool = false
var clicked : bool = false
var default_position : Vector2 = Vector2(0,0)
var target_position : Vector2 = Vector2(0,0)

func _init(cost:int, _card_name:String) -> void:
	self.mana_cost = cost
	self.card_name = _card_name;

func _ready() -> void:
	$ManaCost.text = str(mana_cost)
	$CardName.text = card_name
		
static func instantiate() -> Node:
	var format_string = "res://cards/%s_card.tscn"
	var blah = format_string % ["anger"]
	return load(blah).instantiate()

func set_default_position(pos :Vector2 ) -> void:
	default_position = pos
	target_position = pos
	#move to that position immediately
	#position = pos
		
func _on_area_2d_mouse_entered() -> void:
	target_position = default_position + Vector2(0,-40)
	hovered = true
	z_index = 100

func _on_area_2d_mouse_exited() -> void:
	target_position = default_position
	hovered = false
	z_index = 5

func _process(delta: float) -> void:
	
	var vector = target_position - position
	
	if vector.length() == 0:
		return
	if vector.length() < 5:
		position = target_position
	else:
		position = position + (vector.normalized() * delta *card_speed)
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event.button_mask == 1:
		clicked = true
		print(event)
		print("clicked")
		target_position = event.position#-$Area2D/CollisionShape2D.shape.get_rect().size/2
		target_position.x = target_position.x - 100
	else:
		print(event)
